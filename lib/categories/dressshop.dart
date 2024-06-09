import 'package:flutter/material.dart';
import 'package:wedventure_3/Widgets/Navigationbar.dart';

import '../Widgets/tapBar.dart';

class Dress_shop extends StatefulWidget{
  const Dress_shop({super.key});

  @override
  _dresshopState createState() => _dresshopState();
}

class _dresshopState extends State<Dress_shop>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      bottomNavigationBar: const navigate(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const appBar(pageName: 'Dress shops'),
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
                            Navigator.pushNamed(context, 'dress');
                          },
                          child: Container(
                            width: 150,
                            height: 175,
                            color: Colors.grey,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Modify the width and height properties here
                                  Image.asset(
                                    'images/suitshop/suiteshop1.jpg',
                                    width: 290, // Adjust the width to your desired size
                                    height: 175,
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
                            Navigator.pushNamed(context, 'dress');
                          },
                          child: Container(
                            width: 150,
                            height: 170,
                            color: Colors.grey,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Modify the width and height properties here
                                  Image.asset(
                                    'images/suitshop/suiteshop2.jpg',
                                    width: 300, // Adjust the width to your desired size
                                    height: 170,
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
                            Navigator.pushNamed(context, 'dress');
                          },
                          child: Container(
                            width: 165,
                            height: 200,
                            color: Colors.grey,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Modify the width and height properties here
                                  Image.asset(
                                    'images/suitshop/suiteshop3.jpg',
                                    width: 190, // Adjust the width to your desired size
                                    height: 200,
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
                        // the sec row sec col
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, 'dress');
                          },
                          child: Container(
                            width: 175,
                            height: 200,
                            color: Colors.grey,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Modify the width and height properties here
                                  Image.asset(
                                    'images/suitshop/suiteshop4.jpg',
                                    width: 260, // Adjust the width to your desired size
                                    height: 200,
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
                  const SizedBox(height: 12),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        // first col
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, 'dress');
                          },
                          child: Container(
                            width: 330,
                            height: 100,
                            color: Colors.grey,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Modify the width and height properties here
                                  Image.asset(
                                    'images/suitshop/suiteshop5.jpg',
                                    width: 330, // Adjust the width to your desired size
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

                      ]
                  )
                ],
              )
            )
          ],
        )
      )
    );
  }

}