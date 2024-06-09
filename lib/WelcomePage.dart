import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wedventure_3/Onboarding/Onboarding.dart';
import 'HomePage.dart';


class Welcome_p extends StatelessWidget {
  const Welcome_p({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
             Container(
              width: 598,
              height: 896,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/bg.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: 414,
              height: 896,
              decoration: BoxDecoration(
                color: const Color(0xE5C8A4A4).withOpacity(0.5), // Adjust the opacity value as needed (0.5 for 50% transparency)
              ),
            ),


          const Positioned(
            top: 50.0,
            left: 0,
            right: 0,
            child: Text(
              'Achive your wedding ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w900,
                fontFamily: 'WendyOne',
                color: Colors.white,
              ),
            ),
          ),

          const Positioned(
            top: 180.0,
            left: 0,
            right: 0,
            child: Text(
              'dreams ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w900,
                fontFamily: 'WendyOne',
                color: Colors.white,
              ),
            ),
          ),

          Positioned(
            bottom: 150.0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(100),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(130), // Adjust the value as needed
                child: Image.asset(
                  'images/logo.png',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),


          Positioned(
            top: 250,
            left: 0,
            right: 0,
            child: Container(

              padding: const EdgeInsets.all(20),
              child: const Text(
                'with',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'WendyOne',
                  color: Colors.white,
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  (FirebaseAuth.instance.currentUser != null && FirebaseAuth.instance.currentUser!.emailVerified) ?  const HomePage() : const board()),
                );
              },
              child: const Text('Start', style: TextStyle(color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }
}