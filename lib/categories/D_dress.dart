import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';

class Ddress extends StatefulWidget {
  const Ddress({super.key});

  @override
  _DdressState createState() => _DdressState();
}


class _DdressState extends State<Ddress> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Column(
          children: [
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
                    padding: const EdgeInsets.only(top: 12), // Adjust the top padding as needed
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context); // Navigates back to the previous screen
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
              height: 40,// Set the width of the container
              color: const Color.fromRGBO(201, 165, 165, 1), // background color
              padding: const EdgeInsets.only(top: 10), // Add left padding
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
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 230,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: Colors.white,
                        child: Center(
                          child: Image.asset(
                            'images/Ddress/D_dress.jpg',
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
                  const Text(
                    '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
                            'images/dreeshop 1.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'DRESS SHOP',
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
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Booking()),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(const Color(0xE5C8A4A4)),
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

    );
  }

  Booking() {}
}

