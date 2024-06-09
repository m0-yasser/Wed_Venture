import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';
import '../Widgets/paymobManager.dart';

class appoint extends StatefulWidget {
  final data;

  const appoint({Key? key, this.data}) : super(key: key);

  @override
  _appointState createState() => _appointState();
}

class _appointState extends State<appoint> {
  DateTime? _selectedDate = DateTime.now();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _depositController = TextEditingController();
  String? payMethod;
  CollectionReference Bookings = FirebaseFirestore.instance.collection('Bookings');


  Future<DocumentReference> addBooking() {
    return Bookings.add({
      'Full_name': _nameController.text,
      'Email': _emailController.text,
      'Phone_number': _phoneController.text,
      'Deposit': _depositController.text,
      'Booking_date': _selectedDate,
      'Booked': widget.data['title'],
      'Image': widget.data['image'],
      'User id': FirebaseAuth.instance.currentUser!.uid
    });
  }

  Future<void> _pay() async {
    final depositValue = int.tryParse(_depositController.text) ?? 0;
    PaymobManager().getPaymentKey(depositValue, "EGP").then((String paymentKey) {
      launchUrl(
        Uri.parse('https://accept.paymob.com/api/acceptance/iframes/846257?payment_token=$paymentKey&callback_url=your_scheme://payment?status=success'),
      );
    });

    Map<String, dynamic> data = {
      'new_username': _nameController.text,
      'hname': widget.data['title'],
      'date': _selectedDate.toString(),
    };

    String url = 'https://hall.pythonanywhere.com/hall';
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        final pdfFile = await _savePdfContent(response.bodyBytes);

        // Add booking to Firestore and get the document ID
        DocumentReference bookingRef = await addBooking();
        String bookingId = bookingRef.id;

        // Upload the PDF to Firebase Storage with a unique name
        await _uploadPdfToFirebase(pdfFile, bookingId);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PdfViewer(
              pdfFilePath: pdfFile.path,
            ),
          ),
        );
      } else {
        print('Failed to process PDF: ${response.statusCode}');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }


  Future<void> _uploadPdfToFirebase(File pdfFile, String bookingId) async {
    try {
      // Generate a unique file name
      final uuid = Uuid();
      final uniqueFileName = '${uuid.v4()}.pdf';

      // Create a reference to the Firebase Storage location
      final storageRef = FirebaseStorage.instance.ref().child('pdfs/$uniqueFileName');

      // Upload the file
      await storageRef.putFile(pdfFile);

      // Get the download URL
      final downloadUrl = await storageRef.getDownloadURL();

      // Save the download URL to Firestore
      await FirebaseFirestore.instance.collection('Bookings').doc(bookingId).update({
        'pdfUrl': downloadUrl,
      });

      print('PDF uploaded successfully. Download URL: $downloadUrl');
    } catch (e) {
      print('Failed to upload PDF: $e');
    }
  }

  Future<File> _savePdfContent(List<int> bytes) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/document.pdf');
    return file.writeAsBytes(bytes);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _selectedDate) {
      // Extracting date part without the time
      final DateTime selectedDateWithoutTime = DateTime(picked.year, picked.month, picked.day);
      setState(() {
        _selectedDate = selectedDateWithoutTime;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
        Container(
             decoration: const BoxDecoration(
               border: Border(
                 bottom: BorderSide(
                   color: Colors.white,
                   width: 2,
                 ),
               ),
             ),
             child: Row(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(top: 12),
                   child: IconButton(
                     icon: const Icon(Icons.arrow_back),
                     onPressed: () {
                       Navigator.pop(context);
                     },
                     color: Colors.black,
                   ),
                 ),
               ],
             ),
           ),
           Container(
             width: 250,
             height: 80,
             color: const Color.fromRGBO(201, 165, 165, 1),
             padding: const EdgeInsets.only(top: 10),
             child: const Center(
               child: Text(
                 'Appointment',
                 style: TextStyle(
                   fontSize: 35,
                   fontFamily: 'worksans',
                   fontWeight: FontWeight.bold,
                   color: Colors.white,
                 ),
               ),
             ),
           ),
          const Center(
            child: Text(
              'Choose date & time',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => _selectDate(context),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                minimumSize: MaterialStateProperty.all<Size>(const Size(150, 40)),
                side: MaterialStateProperty.all<BorderSide>(const BorderSide(color: Colors.white)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              child: const SizedBox(
                width: 150,
                child: Center(
                  child: Text(
                    'Select Date',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Text(
            'Selected Date: ${_selectedDate != null ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}' : ''}',
            style: const TextStyle(color: Colors.white),
          ),
          SizedBox(height: 20,),
           Text(
            'Appointment Details',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20,),
          TextField(
            controller: _nameController,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              labelText: 'Full Name',
              labelStyle: const TextStyle(color: Colors.black26),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _emailController,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: const TextStyle(color: Colors.black26),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _phoneController,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              labelText: 'Phone Number',
              labelStyle: const TextStyle(color: Colors.black26),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(),
              ),
            ),
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _depositController,
            style: const TextStyle(color: Colors.black),
               decoration: InputDecoration(
                 labelText: 'Deposit',
                 labelStyle: const TextStyle(color: Colors.black26),
                 floatingLabelBehavior: FloatingLabelBehavior.never,
                 contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                 fillColor: Colors.white,
                 filled: true,
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(25.0),
                   borderSide: const BorderSide(),
                 ),
               ),
               keyboardType: TextInputType.number,
            //decoration: InputDecoration(labelText: 'Deposit'),
          ),
          SizedBox(height: 16.0),
          //Text('Select Payment Method:'),
          Center(
            child: Text(
              'Choose your payment method',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'worksans',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          RadioListTile(
            title: const Text(
              "Cash",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            value: "Cash",
            groupValue: payMethod,
            activeColor: Colors.white,
            onChanged: (val) {
              setState(() {
                payMethod = val as String?;
              });
            },
          ),
          RadioListTile(
            title: const Text(
              "Visa",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            value: "Visa",
            groupValue: payMethod,
            activeColor: Colors.white,
            onChanged: (val) {
              setState(() {
                payMethod = val as String?;
              });
            },
          ),
          RadioListTile(
            title: const Text(
              "PayPal",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            value: "PayPal",
            groupValue: payMethod,
            activeColor: Colors.white,
            onChanged: (val) {
              setState(() {
                payMethod = val as String?;
              });
            },
          ),
          SizedBox(height: 16.0),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                if (payMethod == "Visa") {
                  await _pay();
                  //await addBooking();
                  //Navigator.pushNamed(context, 'Home');
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Error'),
                      content: Text('Please select a payment method.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                minimumSize: MaterialStateProperty.all<Size>(const Size(150, 40)),
                side: MaterialStateProperty.all<BorderSide>(const BorderSide(color: Colors.white)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              child: const SizedBox(
                width: 150,
                child: Center(
                  child: Text(
                    'Book Now',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class PdfViewer extends StatelessWidget {
  final String pdfFilePath;

  PdfViewer({required this.pdfFilePath});

  Future<void> _downloadPdf(BuildContext context) async {
    // Request storage permission
    if (await Permission.storage.request().isGranted) {
      final dir = await getExternalStorageDirectory();
      if (dir != null) {
        final file = File(pdfFilePath);
        final newFile = await file.copy('${dir.path}/downloaded_document.pdf');

        // Notify the user of the download location
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('PDF downloaded to: ${newFile.path}')),
        );
      }
    } else {
      // Handle the case where the permission is denied
      print('Permission denied to access storage.');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
        actions: [
          IconButton(
            icon: Icon(Icons.download),
            onPressed: () => _downloadPdf(context),
          ),
        ],
      ),
      body: PDFView(
        filePath: pdfFilePath,
      ),
    );
  }
}
