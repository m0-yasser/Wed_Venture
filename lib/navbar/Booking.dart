import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  List<QueryDocumentSnapshot> bookingdata = [];

  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("Bookings").get();
    bookingdata.addAll(querySnapshot.docs);
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20,),
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
                'Your Bookings',
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'worksans',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: bookingdata.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1, mainAxisExtent: 250),
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () {
                    String pdfUrl = bookingdata[i]['pdfUrl'];
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PdfViewer(
                          pdfUrl: pdfUrl,
                        ),
                      ),
                    );
                  },
                  onLongPress: (){
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.warning,
                      animType: AnimType.rightSlide,
                      title: "Warning.",
                      desc: 'Are you sure you want to remove your reservation?',
                      btnCancelOnPress:(){
                        print("Cancel");
                      } ,
                      btnOkOnPress: ()async{
                        await FirebaseFirestore.instance.collection("Bookings").doc(bookingdata[i].id).delete();
                        Navigator.of(context).pushReplacementNamed("booking");
                      }
                    ).show();
                  },
                  child: Card(
                    color: Color(0xFFC9A5A5),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            width: 300,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 4.0,
                              ),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.asset(
                                "${bookingdata[i]['Image']}",
                                height: 150,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Text(
                            "${bookingdata[i]['Booked']}",
                            style: TextStyle(
                              fontFamily: 'WorkSans',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Date: ",
                                style: TextStyle(
                                  fontFamily: 'WorkSans',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                DateFormat('yyyy-MM-dd').format(bookingdata[i]['Booking_date'].toDate()),
                                style: TextStyle(
                                  fontFamily: 'WorkSans',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class PdfViewer extends StatelessWidget {
  final String pdfUrl;

  const PdfViewer({Key? key, required this.pdfUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF Viewer"),
      ),
      body: Center(
        child: FutureBuilder<File>(
          future: _downloadAndSaveFile(pdfUrl, 'temp.pdf'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return PDFView(
                  filePath: snapshot.data!.path,
                );
              } else {
                return Text("Failed to load PDF");
              }
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Future<File> _downloadAndSaveFile(String url, String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/$fileName';
    final file = File(filePath);

    final response = await http.get(Uri.parse(url));
    await file.writeAsBytes(response.bodyBytes);
    return file;
  }
}