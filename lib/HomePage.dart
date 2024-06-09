import 'package:flutter/material.dart';
import 'package:wedventure_3/Widgets/Navigationbar.dart';


class  HomePage extends StatefulWidget {
  const  HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const navigate(),

      body: SingleChildScrollView(
        child: Column(
        children: [
          Container(
            width: 414,
            height: 896,
            // clipBehavior: Clip.antiAlias,
            // decoration: ShapeDecoration(
            //   color: const Color(0xFFC8A4A4),
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(0),
            //   ),
            // ),
            child: Stack(
              children: [
                const Positioned(
                  left: 20,
                  top: 255,
                  child: Text(
                    'Category',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'WorkSans',
                      fontWeight: FontWeight.bold,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 111,
                  top: 79,
                  child: Container(
                    width: 171,
                    height: 39,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFC8A4A4),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1, color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 240,
                  child: Container(
                    width: 414,
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 2,
                  top: 410,
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: Container(
                      width: 390, //246
                      height: 160,
                      padding: const EdgeInsets.only(
                          top: 8, left: 8, right: 8, bottom: 12),
                      decoration: ShapeDecoration(
                        color: const Color(0xFFC8A4A4),
                        shape: RoundedRectangleBorder(
                          // side: BorderSide(width: 2, color: Colors.black),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0,right: 10.0),
                                child: IconButton(
                                  color: Colors.black12,
                                  onPressed: () {
                                  },
                                  icon: Image.asset(
                                    'images/homepage/image3.jpeg.jpg',
                                    height: 110,
                                    width: 160,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 5.0, bottom: 5.0,left: 1.0),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        child: IconButton(
                                          color: Colors.black,
                                          onPressed: () {
                                          },
                                          icon: Image.asset(
                                            'images/homepage/image12.jpeg.jpg',
                                            height: 110,
                                            width: 200,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

        ///////////////////////////////////////////////////////////////////////////////
                Positioned(
                  left: 4,
                  top: 610,
                  child: Container(
                    padding: const EdgeInsets.only(top: 8, left: 3, right: 8),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFC8A4A4),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1, color: Color(0xFFC8A4A4)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 380,
                          height: 140,
                          child: Row(
                            children:[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 5.0, bottom: 5.0,right: 1.0),
                                  child: Stack(
                                    children: [
                                      Positioned(

                                        child: IconButton(
                                          color: Colors.black,
                                          onPressed: () {
                                          },
                                          icon: Image.asset(

                                            'images/homepage/image1.jpeg.jpg',
                                            height: 120,
                                            width: 200,
                                            fit: BoxFit.cover,
                                          ),
                                        ),

                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 14),

                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 5.0, bottom: 5.0,left: 1.0),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        child: IconButton(
                                          color: Colors.black,
                                          onPressed: () {
                                          },
                                          icon: Image.asset(
                                            'images/homepage/image11.jpeg.jpg',
                                            height: 190,
                                            width: 200,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 8),

                        const SizedBox(height: 8),


                      ],
                    ),
                  ),
                ),
                const Positioned(
                  left: 25,
                  top: 775,
                  child: Text(
                    'The wedding',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0.07,
                      letterSpacing: -0.18,
                    ),
                  ),
                ),
                const Positioned(
                  left: 30,
                  top: 366,
                  child: Text(
                    'Halls',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w500,
                      height: 0.11,
                      letterSpacing: 0.16,
                    ),
                  ),
                ),
                const Positioned(
                  left: 90,
                  top: 368,
                  child: Text(
                    'MakeupArtists',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w500,
                      height: 0.10,
                      letterSpacing: 0.11,
                    ),
                  ),
                ),

                const Positioned(
                  left: 175,
                  top: 368,
                  child: Text(
                    'photographers',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w500,
                      height: 0.10,
                      letterSpacing: 0.11,
                    ),
                  ),
                ),
                const Positioned(
                  left: 260,
                  top: 366,
                  child: Text(
                    'Dress',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w500,
                      height: 0.10,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
                //where
                Positioned(
                  left: 27,
                  right: 24,
                  top: 157,
                  child: SizedBox(
                    width: 382,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            height: 44,
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(width: 50),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Where do you want to go?',
                                      border: InputBorder.none,
                                      isDense: true,
                                      hintStyle: TextStyle(
                                        color: Color(0xFFAEB0B6),
                                        fontSize: 18,
                                        fontFamily: 'Redacted Script',
                                        fontWeight: FontWeight.w400,
                                        height: 0.10,
                                        letterSpacing: 0.08,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                      ],
                    ),
                  ),
                ),
//////////////////////////////////////////////////////////////////////////////////////////////////////
                const Positioned(
                  left: 340,
                  top: 364,
                  child: Text(
                    'suits',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w500,
                      height: 0.11,
                      letterSpacing: 0.16,
                    ),
                  ),
                ),
                const Positioned(
                  left: 126,
                  top: 95,
                  child: Text(
                    'start your trip',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'WendyOne',
                      fontWeight: FontWeight.w400,
                      height: 0.05,
                      letterSpacing: 0.20,
                    ),
                  ),
                ),
                const Positioned(
                  left: 25,
                  top: 562,
                  child: Text(
                    'The best halls',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0.09,
                      letterSpacing: -0.18,
                    ),
                  ),
                ),
                const Positioned(
                  left: 236,
                  top: 562,
                  child: Text(
                    'Dresses',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0.09,
                      letterSpacing: -0.18,
                    ),
                  ),
                ),
                const Positioned(
                  left: 236,
                  top: 775,
                  child: Text(
                    'suits',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0.09,
                      letterSpacing: -0.18,
                    ),
                  ),
                ),
                /// photo icons    /// photo icons     /// photo icons

                Positioned(
                  left: 10,
                  top: 288,
                  child: Container(
                    width: 68,
                    height: 68,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle, // Use BoxShape.circle for circular borders
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFC8A4A4),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          image: const DecorationImage(fit: BoxFit.fill,image: AssetImage('images/homepage/image8.jpeg.jpg')),
                          border: Border.all(color: Colors.white),
                          borderRadius: (BorderRadius.circular(40.0))),
                      child: IconButton(
                        color: const Color(0x3F000000),
                        onPressed: () {
                           Navigator.pushNamed(context, 'Halls');
                        }, icon: const Icon(Icons.co2),
                        // icon: Image.asset(
                        //   'images/homepage/image8.jpeg.jpg',
                        //   fit: BoxFit.fill,
                        // ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 90,
                  top: 288,
                  child: Container(
                    width: 68,
                    height: 68,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle, // Use BoxShape.circle for circular borders
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFC8A4A4),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          image: const DecorationImage(fit: BoxFit.fill,image: AssetImage('images/homepage/image7.jpeg.jpg')),
                          border: Border.all(color: Colors.white),
                          borderRadius: (BorderRadius.circular(40.0))),
                      child: IconButton(
                        color: const Color(0x3F000000),
                        onPressed: () {
                          Navigator.pushNamed(context, 'Makeup');
                        },
                        icon: const Icon(Icons.co2),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 170,
                  top: 288,
                  child: Container(
                    width: 68,
                    height: 68,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle, // Use BoxShape.circle for circular borders
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFC8A4A4),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          image: const DecorationImage(fit: BoxFit.fill,image: AssetImage('images/homepage/image6.jpeg.jpg')),
                          border: Border.all(color: Colors.white),
                          borderRadius: (BorderRadius.circular(40.0))),
                      child: IconButton(
                        color: const Color(0x3F000000),
                        onPressed: () {
                          Navigator.pushNamed(context, 'photographer');
                        },
                        icon: const Icon(Icons.co2),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 245,
                  top: 288,
                  child: Container(
                    width: 68,
                    height: 68,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFC8A4A4),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          image: const DecorationImage(fit: BoxFit.fill,image: AssetImage('images/homepage/image4.jpeg.jpg')),
                          border: Border.all(color: Colors.white),
                          borderRadius: (BorderRadius.circular(40.0))),
                      child: IconButton(
                        color: const Color(0x3F000000),
                        onPressed: () {
                          Navigator.pushNamed(context, 'dress-shop');
                        },
                        icon: const Icon(Icons.co2),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 320,
                  top: 288,
                  child: Container(
                    width: 68,
                    height: 68,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle, // Use BoxShape.circle for circular borders
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFC8A4A4),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          image: const DecorationImage(fit: BoxFit.fill,image: AssetImage('images/homepage/image5.jpeg.jpg')),
                          border: Border.all(color: Colors.white),
                          borderRadius: (BorderRadius.circular(40.0))),
                      child: IconButton(
                        color: const Color(0x3F000000),
                        onPressed: () {
                          Navigator.pushNamed(context, 'Suit-shop');
                        },
                        icon: const Icon(Icons.co2),
                      ),
                    ),

                  ),
                ),

                const Positioned(
                  left: 23,
                  top: 401,
                  child: Text(
                    'Offers',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'WorkSans',
                      fontWeight: FontWeight.w500,
                      height: 0.06,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        ),
      ),
      );
  }
}