import 'package:flutter/material.dart';
import 'package:wedventure_3/Widgets/Navigationbar.dart';
import '../Widgets/tapBar.dart';

class Suits extends StatefulWidget {
  const Suits({super.key});

  @override
  _SuitsState createState() => _SuitsState();
}
class _SuitsState extends State<Suits> {
  @override
  Widget build(BuildContext context) {

      return Scaffold(
           bottomNavigationBar: const navigate(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const appBar(pageName: 'Suits'),
              SizedBox(
                height: 535,
                child: ListView(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // 1- the first row  ...first col
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, 'Dsuit');
                            },
                            child: Container(
                              width: 170,
                              height: 119,
                              color: Colors.grey,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Modify the width and height properties here
                                    Image.asset(
                                      'images/suit/suit2.jpg',
                                      width: 180, // Adjust the width to your desired size
                                      height: 119,
                                      // Adjust the height to your desired size
                                    ),
                                    // Text(
                                    //   'Tap to Navigate',
                                    //   style: TextStyle(color: Colors.white),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ),


                          // 2- the first row  ...second col
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, 'Dsuit');
                            },
                            child: Container(
                              width: 160,
                              height: 119,
                              color: Colors.grey,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Modify the width and height properties here
                                    Image.asset(
                                      'images/suit/suit1.jpg',
                                      width: 250, // Adjust the width to your desired size
                                      height: 119,
                                      // Adjust the height to your desired size
                                    ),
                                    // Text(
                                    //   'Tap to Navigate',
                                    //   style: TextStyle(color: Colors.white),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]
                    ),
                    const SizedBox(height: 40),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, 'Dsuit');
                            },
                            child: Container(
                              width: 165,
                              height: 230,
                              color: Colors.grey,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Modify the width and height properties here
                                    Image.asset(
                                      'images/suit/suit3.jpg',
                                      width: 165, // Adjust the width to your desired size
                                      height: 230,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // the sec row sec col
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, 'Dsuit');
                            },
                            child: Container(
                              width: 148,
                              height: 230,
                              color: Colors.grey,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Modify the width and height properties here
                                    Image.asset(
                                      'images/suit/suit4.jpg',
                                      width: 165, // Adjust the width to your desired size
                                      height: 230,
                                      // Adjust the height to your desired size
                                    ),
                                    // Text(
                                    //   'Tap to Navigate',
                                    //   style: TextStyle(color: Colors.white),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]),

                    const SizedBox(height: 12),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          // first col
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, 'Dsuit');
                            },
                            child: Container(
                              width: 140,
                              height: 100,
                              color: Colors.grey,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Modify the width and height properties here
                                    Image.asset(
                                      'images/suit/suit5.jpg',
                                      width: 150, // Adjust the width to your desired size
                                      height: 100,
                                      // Adjust the height to your desired size
                                    ),
                                    // Text(
                                    //   'Tap to Navigate',
                                    //   style: TextStyle(color: Colors.white),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          //  sec col
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, 'Dsuit');
                            },
                            child: Container(
                              width: 145,
                              height: 100,
                              color: Colors.grey,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Modify the width and height properties here
                                    Image.asset(
                                      'images/suit/suit6.jpg',
                                      width: 165, // Adjust the width to your desired size
                                      height: 100,
                                      // Adjust the height to your desired size
                                    ),
                                    // Text(
                                    //   'Tap to Navigate',
                                    //   style: TextStyle(color: Colors.white),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ])
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    // );
  }
}