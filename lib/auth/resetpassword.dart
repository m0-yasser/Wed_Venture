import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../HomePage.dart';

class reset extends StatefulWidget {
  const reset({super.key});

  @override
  _resetState createState() => _resetState();
}

class _resetState extends State<reset> {
  TextEditingController currentpass = TextEditingController();
  TextEditingController newpass = TextEditingController();
  TextEditingController confirmnewpass = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _currentPasswordCorrect = false;

  Future<void> _verifyCurrentPassword() async {
    final currentUser = _auth.currentUser;
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: currentUser!.email!,
        password: currentpass.text,
      );
      if (userCredential != null) {
        setState(() {
          _currentPasswordCorrect = true;
        });
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('Incorrect current password'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [

            Form(
              key: formState,
        child: Column(
        children: [
            const SizedBox(height: 50),
            Center( // Center widget
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center, // Align children to the center horizontally
                children: [
                  const Text(
                    'Change',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'WorkSans'
                    ),
                  ),
                  const Text(
                    'Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                        fontFamily: 'WorkSans'
                    ),
                  ),
                  const SizedBox(height: 20), // Adjust spacing between texts
                  const Text(
                    'To change password, please fill in the fields below. Your password must contain at least 8 characters. It must also include at least one uppercase letter, one lowercase letter, one number, and one special character.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.5,
                        fontFamily: 'WorkSans'
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 20), // Adjust spacing
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Current Password',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                            fontFamily: 'WorkSans'
                        ),
                      ),
                      const SizedBox(height: 8), // Adjust spacing
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0), // Added padding
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12.0), // Increase border radius
                        ),
                        child: TextFormField(
                          controller: currentpass,
                          obscureText: true, // Hide the entered text
                          style: const TextStyle(color: Colors.black), // Text color in input box
                          decoration: const InputDecoration(
                            hintText: 'Current password',
                            hintStyle: TextStyle(color: Colors.black26), // bldck hint text color
                            border: InputBorder.none, // Removed input box border
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20), // Additional spacing
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'New Password',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                            fontFamily: 'WorkSans'
                        ),
                      ),
                      const SizedBox(height: 8), // Adjust spacing
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0), // Added padding
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white), // Add white border
                          borderRadius: BorderRadius.circular(12.0), // Increase border radius
                        ),
                        child: TextFormField(
                          controller: newpass,
                          obscureText: true, // Hide the entered text
                          style: const TextStyle(color: Colors.black), // Text color in input box
                          decoration: const InputDecoration(
                            hintText: 'New password',
                            hintStyle: TextStyle(color: Colors.black26), // black hint text color
                            border: InputBorder.none, // Removed input box border
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20), // Additional spacing
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Confirm New Password',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                            fontFamily: 'WorkSans'
                        ),
                      ),
                      const SizedBox(height: 8), // Adjust spacing
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0), // Added padding
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white), // Add white border
                          borderRadius: BorderRadius.circular(12.0), // Increase border radius
                        ),
                        child: TextFormField(
                          controller: confirmnewpass,
                          obscureText: true, // Hide the entered text
                          style: const TextStyle(color: Colors.black), // Text color in input box
                          decoration: const InputDecoration(
                            hintText: 'Confirm new password',
                            hintStyle: TextStyle(color: Colors.black26), // Yellow hint text color
                            border: InputBorder.none, // Removed input box border
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Additional spacing
            ElevatedButton( // Replaced RaisedButton with ElevatedButton
              onPressed: () async {
                if (formState.currentState!.validate() &&
                    currentpass.text.isNotEmpty) {
                  try {
                    await _verifyCurrentPassword();
                    if (_currentPasswordCorrect) {
                      await _auth.currentUser!
                          .updatePassword(newpass.text);
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(
                        backgroundColor: Colors.green,
                        content: Text('Password Changed Successfully'),
                      ));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Incorrect current password'),
                      ));
                    }
                  } catch (error) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Incorrect current password'),
                    ));
                  }
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(201, 165, 165, 1)), // Button color
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), // Button border radius
                    side: const BorderSide(color: Colors.white), // Add white border
                  ),
                ),
              ),
              child: const Text(
                'Change Password',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'WendyOne'
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
