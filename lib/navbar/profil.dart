import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'package:graduation_project/tapBar.dart';



class profil extends StatefulWidget {
  const profil({super.key});

  @override
  _profilState createState() => _profilState();
}
class _profilState extends State<profil> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: ListView(
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
                        Navigator.pop(context);
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
              height: 80,// Set the width of the container
              color: const Color.fromRGBO(201, 165, 165, 1), // background color
              padding: const EdgeInsets.only(top: 10), // Add left padding
              child: const Center(
                child: Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 45,
                    fontFamily: 'worksans',//  font size
                    fontWeight: FontWeight.bold, // Make text bold
                    color: Colors.white, //  text color
                  ),
                ),
              ),
            ),
            FirebaseAuth.instance.currentUser!.emailVerified
            ?Container(
              width: 250,
              height: 80,
              color: const Color.fromRGBO(201, 165, 165, 1), // background color
              padding: const EdgeInsets.only(top: 10), // Add left padding
              child: const Center(
                child: Text(
                  'Your Email Is Verified, Welcome',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'worksans',//  font size
                    fontWeight: FontWeight.w300,
                    color: Colors.green,
                  ),
                ),
              ),
            ) :  MaterialButton(
              onPressed: (){
                FirebaseAuth.instance.currentUser!.sendEmailVerification();
              },
              child: const Center(
                child: Text(
                  "Your Email isn't verified, Click here to verify",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'worksans',//  font size
                    fontWeight: FontWeight.w300, // Make text bold
                    color: Colors.red, //  text color
                  ),
                ),
              ),
            ),

            Container(
              width: 200,
              height: 80,
              color: const Color.fromRGBO(201, 165, 165, 1),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20), // Add horizontal padding
              child: const Align(
                alignment: Alignment.centerLeft, // Align text to the left
                child: Text(
                  'Statistics',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
               TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const profil()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white), // Set button background color to white
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(356), // Set button border radius
                    ),
                  ),
                ),
                child: Container(
                  width: 350,
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(356),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40), // Set border radius for the image
                        child: Image.asset(
                          'images/profile/following.PNG', // Replace 'images/phgr1.jpg' with your actual image path
                          width: 40,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10), // Adjust spacing between image and text as needed
                      const Text(
                        'Following',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontFamily: 'tajwal',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 10),
               TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,'Fav'
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(356),
                    ),
                  ),
                ),
                child: Container(
                  width: 350,
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(356),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          'images/profile/favourite.PNG',
                          width: 40,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10), // Adjust spacing between image and text as needed
                      const Text(
                        'Favourite',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontFamily: 'tajwal',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 10),
            Container(
              width: 200,
              height: 80,
              color: const Color.fromRGBO(201, 165, 165, 1),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20), // Add horizontal padding
              child: const Align(
                alignment: Alignment.centerLeft, // Align text to the left
                child: Text(
                  'Social Links',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
               TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const profil()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white), // Set button background color to white
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(356), // Set button border radius
                    ),
                  ),
                ),
                child: Container(
                  width: 350,
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(356),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          'images/profile/gmail.PNG',
                          width: 40,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10), // Adjust spacing between image and text as needed
                      const Text(
                        'Gmail',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontFamily: 'tajwal',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            Container(
              width: 200,
              height: 80,
              color: const Color.fromRGBO(201, 165, 165, 1),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20), // Add horizontal padding
              child: const Align(
                alignment: Alignment.centerLeft, // Align text to the left
                child: Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
             TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,'accinfo'
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white), // Set button background color to white
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(356), // Set button border radius
                    ),
                  ),
                ),
                child: Container(
                  width: 350,
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(356),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          'images/profile/setting.PNG',
                          width: 40,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10), // Adjust spacing between image and text as needed
                      const Text(
                        'Account Info',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontFamily: 'tajwal',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 10),
               TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'reset');
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white), // Set button background color to white
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(356), // Set button border radius
                    ),
                  ),
                ),

                child: Container(
                  width: 350,
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(356),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40), // Set border radius for the image
                        child: Image.asset(
                          'images/profile/changepassword.PNG', // Replace 'images/phgr1.jpg' with your actual image path
                          width: 40,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10), // Adjust spacing between image and text as needed
                      const Text(
                        'Change Password',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontFamily: 'tajwal',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 10),
               TextButton(
                onPressed: () async {
                  GoogleSignIn googleSignIn = GoogleSignIn();
                  googleSignIn.disconnect();
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushNamedAndRemoveUntil('welcome', (route) => false);
                  },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white), // Set button background color to white
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(356), // Set button border radius
                    ),
                  ),
                ),
                child: Container(
                  width: 350,
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(356),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40), // Set border radius for the image
                        child: Image.asset(
                          'images/profile/signout.PNG', // Replace 'images/phgr1.jpg' with your actual image path
                          width: 40,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10), // Adjust spacing between image and text as needed
                      const Text(
                        'Sign Out',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontFamily: 'tajwal',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 10),
          ],
        ),
    );
  }
}






















