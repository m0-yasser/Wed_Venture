import 'package:flutter/material.dart';

import 'Appointment.dart';
//import 'package:url_launcher/url_launcher.dart';


class Dmakeup extends StatefulWidget {
  final data;
  const Dmakeup({super.key, this.data});

  @override
  _DmakeupState createState() => _DmakeupState();
}
class _DmakeupState extends State<Dmakeup> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white, // Set border color
                    width: 2, // Set border width
                  ),
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    // Adjust the top padding as needed
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(
                            context); // Navigates back to the previous screen
                      },
                      color: Colors.black, // Set icon color
                    ),
                  ),
                  // Add other widgets here if needed
                ],
              ),
            ),

            Container(
              width: 250,
              height: 40,
              // Set the width of the container
              color: const Color.fromRGBO(201, 165, 165, 1),
              // background color
              padding: const EdgeInsets.only(top: 10),
              // Add left padding
              child: const Center(
                child: Text(
                  'Product details',
                  style: TextStyle(
                    fontSize: 28, //  font size
                    fontWeight: FontWeight.w600, // Make text bold
                    color: Colors.white, //  text color
                  ),
                ),
              ),
            ),

            Container(
              color: const Color.fromRGBO(201, 165, 165, 1),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 470,
                    height: 230,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        color: Colors.white,
                        child: Center(
                          child: Image.asset(
                            widget.data['image2'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Divider(
                    color: Colors.white, // Customize the color of the divider as per your design
                    thickness: 1, // Adjust the thickness of the divider
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: SizedBox(
                          width: 90,
                          height: 90,
                          child: Image.asset(
                            widget.data['ownerlogo'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.data['title'],
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Owner',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[200],
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: IconButton(
                          icon: Image.asset('images/ph.jpg'),
                          onPressed: () {
                            // _launchPhone('123456789');
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Divider(
                    color: Colors.white, // Customize the color of the divider as per your design
                    thickness: 1, // Adjust the thickness of the divider
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Type',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.radio_button_checked, // You can use any bullet point icon you prefer
                        color: Colors.white,
                        size: 24,
                      ),
                      SizedBox(width: 8), // Adjust the spacing between the bullet point and the text
                      Text(
                        widget.data['price1'],
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.radio_button_checked, // You can use any bullet point icon you prefer
                        color: Colors.white,
                        size: 24,
                      ),
                      SizedBox(width: 8), // Adjust the spacing between the bullet point and the text
                      Text(
                        widget.data['price2'],
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> appoint(data: widget.data,)));
                        // Navigator.pushNamed(
                        //     context, 'appoint'
                        // );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color(0xE5C8A4A4)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(356),
                            side: const BorderSide(color: Colors.white, width: 5),
                          ),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 15, top: 6),
                        child: Text(
                          'Book Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontFamily: 'WendyOne',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      //   ),
    );
  }
  //   return Scaffold(
  //     body: Column(
  //       children: [
  //         const SizedBox(height: 30),
  //         Container(
  //           decoration: const BoxDecoration(
  //             border: Border(
  //               bottom: BorderSide(
  //                 color: Colors.white, // Set border color
  //                 width: 2, // Set border width
  //               ),
  //             ),
  //           ),
  //           child: Row(
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.only(top: 12), // Adjust the top padding as needed
  //                 child: IconButton(
  //                   icon: const Icon(Icons.arrow_back),
  //                   onPressed: () {
  //                     Navigator.pop(context); // Navigates back to the previous screen
  //                   },
  //                   color: Colors.black, // Set icon color
  //                 ),
  //               ),
  //               // Add other widgets here if needed
  //             ],
  //           ),
  //         ),
  //
  //         Container(
  //           width: 200,
  //           height: 40,// Set the width of the container
  //           color: const Color.fromRGBO(201, 165, 165, 1), // background color
  //           padding: const EdgeInsets.only(top: 10), // Add left padding
  //           child: const Center(
  //             child: Text(
  //               'Product details',
  //               style: TextStyle(
  //                 fontSize: 28, //  font size
  //                 fontWeight: FontWeight.w600, // Make text bold
  //                 color: Colors.white, //  text color
  //               ),
  //             ),
  //           ),
  //         ),
  //
  //         Expanded(
  //           child: Container(
  //             color: const Color.fromRGBO(201, 165, 165, 1),
  //             // padding: EdgeInsets.all(2),
  //             child: ListView(
  //               children: <Widget>[
  //                 Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                     children: [
  //                       ClipRRect(
  //                         borderRadius: BorderRadius.circular(20),
  //                         child: Container(
  //                           width: 390,
  //                           height: 250,
  //                           color: Colors.white,
  //                           child: Center(
  //                             child: Image.asset(
  //                               'images/Dsuit/Dsuit1.jpg',
  //                               width: 330,
  //                               height: 250,
  //                             ),
  //
  //                           ),
  //                         ),
  //                       ),
  //
  //
  //
  //                     ]
  //                 ),
  //
  //                 const Padding(
  //                   padding: EdgeInsets.only(left: 25,top: 30), // Add left padding
  //                   child: Text(
  //                     'Description',
  //                     style: TextStyle(
  //                       fontSize: 28,
  //                       fontWeight: FontWeight.w700,
  //                       color: Colors.white,
  //                     ),
  //                   ),
  //                 ),
  //
  //                 // SizedBox(height: 5), // Adding some space between the two text widgets
  //                 const Padding(
  //                   padding: EdgeInsets.only(left: 25,top: 15), // Add left padding
  //                   child: Text(
  //                     '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^',
  //                     style: TextStyle(
  //                       fontSize: 16,
  //                       fontWeight: FontWeight.w700,
  //                       color: Colors.white,
  //                     ),
  //                   ),
  //                 ),
  //
  //
  //                 Row(
  //                   children: [
  //                     Padding(
  //                       padding: const EdgeInsets.only(left: 20), // Adjust the left padding as needed
  //                       child: ClipRRect(
  //                         borderRadius: BorderRadius.circular(50),
  //                         child: SizedBox(
  //                           width: 90,
  //                           height: 90,
  //                           // color: Colors.white,
  //                           child: Center(
  //                             child: Image.asset(
  //                               'images/Dsuit/Dsuit2.jpg',
  //                               width: 90,
  //                               height: 90,
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     const SizedBox(width: 10), // Add some space between the image and the text
  //                     Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         const Text(
  //                           'SUIT SHOP', // Text for brand
  //                           style: TextStyle(
  //                             fontSize: 24,
  //                             fontWeight: FontWeight.w500,
  //                             color: Colors.white,
  //                           ),
  //                         ),
  //                         // SizedBox(height: 3), // Add some space between the text items
  //                         Padding(
  //                           padding: const EdgeInsets.only(left: 7), // Adjust the left and top padding as needed
  //                           child: Text(
  //                             'Owner', // Additional text
  //                             style: TextStyle(
  //                               fontSize: 20,
  //                               fontWeight: FontWeight.w400,
  //                               color: Colors.grey[200],
  //                               letterSpacing: 1.5,
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     const SizedBox(width: 80),
  //                     Container(
  //                       width: 50, // Add the width property and specify the desired width
  //                       decoration: BoxDecoration(
  //                         color: Colors.white,
  //                         borderRadius: BorderRadius.circular(50),
  //                       ),
  //                       child: IconButton(
  //                         icon: Image.asset('images/ph.jpg'), // Replace 'images/phone.jpeg' with your image path
  //                         onPressed: () {
  //                           // _launchPhone('123456789'); // Replace '123456789' with the actual phone number
  //                         },
  //                       ),
  //                     ),
  //
  //                   ],
  //                 ),
  //                 const SizedBox(height: 20),
  //                 Row(
  //                   // mainAxisAlignment: MainAxisAlignment.end, // Align children to the end of the row
  //                   children: [
  //                     Padding(
  //                       padding: const EdgeInsets.only(left:185), // Adjust padding as needed
  //                       child: TextButton(
  //                         onPressed: () {
  //                           Navigator.push(
  //                             context,
  //                             MaterialPageRoute(builder: (context) => Booking()),
  //                           );
  //                         },
  //                         child: Container(
  //                           width: 200,
  //                           height: 55,
  //                           padding: const EdgeInsets.only(left: 37 ,top: 6),
  //                           decoration: BoxDecoration(
  //                             color: const Color(0xE5C8A4A4),
  //                             borderRadius: BorderRadius.circular(356),
  //                             border: Border.all(color: Colors.white, width: 5),
  //                           ),
  //                           child: const Text(
  //                             'Book Now',
  //                             style: TextStyle(
  //                               color: Colors.white,
  //                               fontSize: 24,
  //                               fontFamily: 'WendyOne',
  //                               fontWeight: FontWeight.w600,
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );


  Booking() {}
}

