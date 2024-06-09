import 'package:flutter/material.dart';

class intro3 extends StatelessWidget {
  const intro3({super.key});

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Transform.translate(
                    offset: const Offset(0, -120),
                    child: Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150),
                        image: const DecorationImage(
                          image: AssetImage('images/intro/intro5.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Transform.translate(
                    offset: const Offset(0, -120),
                    child: Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150),
                        image: const DecorationImage(
                          image: AssetImage('images/intro/intro6.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Transform.translate(
                    offset: const Offset(0, -120),
                    child: Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150),
                        image: const DecorationImage(
                          image: AssetImage('images/intro/intro7.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Text(
              'Professional Photographers and Makeup Artists',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'WorkSans'
              ),
            ),
          ],
        ),
      ),
    );
  }
}
