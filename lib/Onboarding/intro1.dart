import 'package:flutter/material.dart';

class intro1 extends StatelessWidget {
  const intro1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xffe772aa), // Start color
            Color(0xFFEFC1A0), // End color
          ],
          begin: Alignment.topCenter,
          end:  Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.translate(
              offset: const Offset(0, -120),
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                  image: const DecorationImage(
                    image: AssetImage('images/intro/intro1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // SizedBox(height: 20), // Add some space between the image and text
            const Text(
              'Book Your Wedding',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'WorkSans'
              ),
            ),
            const Text(
              ' With Us!',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'WorkSans'
              ),
            ),
            const Text(
              ' We Guide You To Your Dream.',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w200,
                  fontFamily: 'WorkSans'
              ),
            ),
          ],
        ),
      ),
    );
  }
}
