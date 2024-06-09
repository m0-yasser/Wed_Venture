import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class forget extends StatefulWidget {
  const forget({super.key});

  @override
  _forgetState createState() => _forgetState();
}
class _forgetState extends State<forget> {
  TextEditingController email = TextEditingController();
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
            const SizedBox(height: 10),
            Container(
              width: 200,
              height: 80,
              color: const Color.fromRGBO(201, 165, 165, 1),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20), // Add horizontal padding
              child: const Align(
                alignment: Alignment.centerLeft, // Align text to the left
                child: Text(
                  'Forget Password',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'WorkSans'
                  ),
                ),
              ),
            ),
            // SizedBox(height: 0),
            Container(
              width: 200,
              height: 100,
              color: const Color.fromRGBO(201, 165, 165, 1),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20), // Add horizontal padding
              child: const Align(
                alignment: Alignment.centerLeft, // Align text to the left
                child: Text(
                  'Opps! It happens to the best of us .'
                      'Input your email address to fix the issues. ',

                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'WorkSans'
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 230,
                  height: 148,
                  child: Center(
                    child: Image.asset(
                      'images/lab.jpg',
                      width: 330,
                      height: 171,
                    ),
                  ),
                ),
              ],
            ),

            Container(
              width: 100,
              height: 80,
              color: const Color.fromRGBO(201, 165, 165, 1),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20), // Add horizontal padding
              child: const Align(
                alignment: Alignment.center, // Align text to the left
                child: Text(
                  'Enter your email adress',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                      fontFamily: 'WorkSans'
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.center,
              child: Container(
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(201, 165, 165, 1), // Set background color to pink
                  border: Border.all(color: Colors.white, width: 3), // Set white border
                ),
                // padding: EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 3.0,),

                    ),
                    SizedBox(
                      width: 250, // Set a fixed width
                      child: TextField(
                        controller: email,
                        decoration: const InputDecoration(
                          hintText: 'input here',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            height: 1.5,
                            letterSpacing: 0.08,
                          ),
                        ),
                        style: const TextStyle(
                          color: Colors.white, // Set text color to white
                        ),
                        // onChanged: (value) {
                        //   // Handle search input changes here
                        // },
                      ),
                    ),
                  ],
                ),
              ),
            ),


            const SizedBox(height: 30),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () async{
                  if(email.text == ''){
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.rightSlide,
                      title: 'Invalid.',
                      desc: 'Please enter your e-mail to continue',
                    ).show();
                    return;
                  }
                  await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.info,
                    animType: AnimType.rightSlide,
                    title: 'You are all set.',
                    desc: 'We sent a link to your e-mail to reset your password',
                  ).show();
                  Navigator.pushNamed(
                    context, 'login',
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const Color(0xE5C8A4A4)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(color: Colors.white, width: 5),
                    ),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 20, top: 5),
                  child: Text(
                    'Submit   ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'WendyOne',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

    );
  }
}
