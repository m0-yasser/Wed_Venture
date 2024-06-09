import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wedventure_3/auth/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  CollectionReference users = FirebaseFirestore.instance.collection('Users');

        late final String? Function(String?) validator = (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required.';
          }
          return null;
        };

  DateTime? _selectedDate;
  bool showPass = true;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
      'full_name': fullname.text,
      'username': username.text,
      'Email': email.text,
      'Address': address.text,
      'Phone number': phone.text,
      'Gender': _selectedGender,
      'DOB': _selectedDate != null ? _selectedDate!.toIso8601String() : null,
      'id': FirebaseAuth.instance.currentUser!.uid,
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
  late final  bool _agreeToTerms = false;
  String? _selectedGender;
  var isChecked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            Form(
              key: formState,

              child:  Container(
                  width: 414,
                  height: 896,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: -100,
                        top: -0,
                        child: Container(
                          width: 598,
                          height: 896,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/bg.jpeg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      // the filter of page
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 414,
                          height: 896,
                          decoration: BoxDecoration(
                            color: const Color(0xE5C8A4A4).withOpacity(0.5),
                          ),
                        ),
                      ),

                      const Positioned(
                        left: 121,
                        top: 60,
                        child: SizedBox(
                          width: 165,
                          height: 59,
                          child: Text(
                            'Sign Up',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontFamily: 'WendyOne',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ),
                      ),

                      // the icon for return to loginpage
                      Positioned(
                        left: 15, // Adjust left position as needed
                        top: 35, // Adjust top position as needed
                        child: Container(
                          decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                          child: IconButton(
                            icon:  Image.asset(
                              'images/back2.png',
                              width: 40,
                              height: 70,
                              // Icon(Icons.arrow_back),

                            ),
                            onPressed: () {
                              Navigator.pop(context); // Navigate back to the previous page
                            },
                            tooltip: 'Back to login', // Tooltip to provide a clear indication of the action
                          ),
                        ),
                      ),

                      Positioned(
                        left: 60,
                        top: 130,
                        child: Container(
                          width: 300,
                          height: 49,
                          padding: const EdgeInsets.all(12),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF8F8F8),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1, color: Color(0xFFB2B2B2)),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: TextFormField(
                            controller: fullname,
                            decoration: const InputDecoration(
                              //contentPadding: EdgeInsets.only(top: 1),
                              border: InputBorder.none,
                              hintText: 'Full Name',
                              hintStyle: TextStyle(
                                color: Color(0xFF5F5F5F),
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            style: const TextStyle(
                              color: Colors.black, // Change text color to black
                            ),
                            keyboardType: TextInputType.text, // Set keyboard type to text
                            // Add validation and saving logic here
                          ),
                        ),
                      ),

                      // 3-email input..............
                      Positioned(
                        left: 60,
                        top: 190,
                        child: Container(
                          width: 300,
                          height: 49,
                          padding: const EdgeInsets.all(12),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF8F8F8),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1, color: Color(0xFFB2B2B2)),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: TextFormField(
                            controller: email,
                            validator: validator,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                color: Color(0xFF5F5F5F),
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            style: const TextStyle(
                              color: Colors.black, // Change text color to black
                            ),

                          ),
                        ),
                      ),
                      // 4- the user name input ..............
                      Positioned(
                        left: 60,
                        top: 250,
                        child: Container(
                          width: 300,
                          height: 49,
                          padding: const EdgeInsets.all(12),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF8F8F8),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1, color: Color(0xFFB2B2B2)),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),

                          child: TextFormField(
                            controller: username,
                            validator: validator,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Username',
                              hintStyle: TextStyle(
                                color: Color(0xFF5F5F5F),
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            style: const TextStyle(
                              color: Colors.black, // Change text color to black
                            ),
                          ),
                        ),
                      ),
                      // 5- date of birth input.................
                      Positioned(
                        left: 60,
                        top: 310,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                _selectDate(context);
                              },
                              child: Container(
                                width: 300,
                                height: 49,
                                padding: const EdgeInsets.all(12),
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFF8F8F8),
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(width: 1, color: Color(0xFFB2B2B2)),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: Text(
                                    _selectedDate != null
                                        ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                                        : 'DD/MM/YYYY',
                                    style: const TextStyle(
                                      color: Color(0xFF5F5F5F),
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                //),
                              ),
                            ),
                          ],
                        ),
                      ),


                      // 6- the gender input................
                      Positioned(
                        left: 50,
                        top: 364,
                        child: TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Select Gender'),
                                  content: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ListTile(
                                          title: const Text('Male'),
                                          onTap: () {
                                            setState(() {
                                              _selectedGender = 'Male';
                                            });
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        ListTile(
                                          title: const Text('Female'),
                                          onTap: () {
                                            setState(() {
                                              _selectedGender = 'Female';
                                            });
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            width: 300,
                            height: 49,
                            padding: const EdgeInsets.all(12),
                            decoration: ShapeDecoration(
                              color: const Color(0xFFF8F8F8),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(width: 1, color: Color(0xFFB2B2B2)),
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _selectedGender != null ? _selectedGender! : 'Gender',
                                  style: TextStyle(
                                    color: _selectedGender != null ? Colors.black : const Color(0xFF5F5F5F),
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        left: 60,
                        top: 436,
                        child: Container(
                          width: 300,
                          height: 49,
                          padding: const EdgeInsets.all(12),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF8F8F8),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1, color: Color(0xFFB2B2B2)),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: TextFormField(
                            controller: address,
                            decoration: const InputDecoration(
                              hintText: 'Address',
                              hintStyle: TextStyle(
                                color: Color(0xFF5F5F5F),
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height:0,
                              ),
                              border: InputBorder.none,
                            ),
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            // Add validation and saving logic here
                          ),
                        ),
                      ),

                      //      8- the phone number input.
                      Positioned(
                        left: 60,
                        top: 498,
                        child: Container(
                          width: 300,
                          height: 49,
                          padding: const EdgeInsets.all(12),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF8F8F8),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1, color: Color(0xFFB2B2B2)),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: TextFormField(
                            controller: phone,
                            decoration: const InputDecoration(
                              hintText: 'Phone Number',
                              hintStyle: TextStyle(
                                color: Color(0xFF5F5F5F),
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                              border: InputBorder.none,
                            ),
                            keyboardType: TextInputType.phone, // Set the keyboard type to phone
                            style: const TextStyle(
                              color: Colors.black, // Text color of the user input
                            ),
                            // Add validation and saving logic here
                          ),
                        ),
                      ),
                      //     9- the password input .
                      Positioned(
                        left: 60,
                        top: 563,
                        child: Container(
                          width: 300,
                          height: 49,
                          padding: const EdgeInsets.all(12),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF8F8F8),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1, color: Color(0xFFB2B2B2)),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: TextFormField(
                            controller: password,
                            validator: validator,
                            obscureText: showPass,
                            decoration: InputDecoration(
                              suffixIcon:  IconButton(
                                padding: const EdgeInsets.only(bottom: 5),
                                  onPressed: () {
                                    setState(() {
                                      showPass = !showPass;
                                    });
                                  },
                                  icon: Icon(
                                    showPass
                                        ? Icons.visibility_off_rounded
                                        : Icons.visibility_rounded,
                                    size: 25,
                                    color: Colors.black,
                                  )
                              ),
                              hintText: 'Password',
                              hintStyle: const TextStyle(
                                color: Color(0xFF5F5F5F),
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                              border: InputBorder.none,
                            ),
                            // Hide the entered text for security
                            style: const TextStyle(
                              color: Colors.black, // Text color of the user input
                            ),
                            // Add validation and saving logic here
                          ),

                        ),
                      ),

                      //     9- the confirm input
                      Positioned(
                        left: 60,
                        top: 630,
                        child: Container(
                          width: 300,
                          height: 49,
                          padding: const EdgeInsets.all(12),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF8F8F8),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1, color: Color(0xFFB2B2B2)),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              suffixIcon:  IconButton(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  onPressed: () {
                                    setState(() {
                                      showPass = !showPass;
                                    });
                                  },
                                  icon: Icon(
                                    showPass
                                        ? Icons.visibility_off_rounded
                                        : Icons.visibility_rounded,
                                    size: 25,
                                    color: Colors.black,
                                  )
                              ),
                              hintText: 'Confirm Password',
                              hintStyle: const TextStyle(
                                color: Color(0xFF5F5F5F),
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                              border: InputBorder.none,
                            ),
                            keyboardType: TextInputType.visiblePassword, // Set the keyboard type to visible password
                            obscureText: true, // Hide the entered text for security
                            style: const TextStyle(
                              color: Colors.black, // Text color of the user input
                            ),
                            // Add validation and saving logic here
                          ),
                        ),
                      ),

                      Positioned(
                        left: 80,
                        top: 690,
                        child: Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              activeColor: Colors.white,
                              tristate: true,
                              onChanged: (newBool) {
                                setState(() {
                                  isChecked = newBool;
                                  }
                                );
                              },
                            ),
                            const Text(
                              'I agree to the terms of use',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),


                      Positioned(
                        left: 70,
                        top: 735, // Adjust the top position
                        child: TextButton(
                          onPressed: () async {
                           // final email = email.text;
                            if(formState.currentState!.validate()){
                              try {
                                final Credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                  email: email.text,
                                  password: password.text,
                                );
                                addUser();
                                FirebaseAuth.instance.currentUser!.sendEmailVerification();
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login()),
                                );
                              } on FirebaseAuthException catch (e) {
                                String errorMessage = 'An error occurred';
                                if (e.code == 'weak-password') {
                                  errorMessage = 'The password provided is too weak.';
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.error,
                                    animType: AnimType.rightSlide,
                                    title: 'The password provided is too weak.',
                                    desc: errorMessage,
                                  ).show();
                                } else if (e.code == 'email-already-in-use') {
                                  errorMessage = 'The account already exists for that email.';
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.error,
                                    animType: AnimType.rightSlide,
                                    title: 'The account already exists for that email.',
                                    desc: errorMessage,
                                  ).show();
                                }
                              } catch (e) {
                                print(e);
                              }
                            }else{
                              print("Not Valid");
                            }
                          },

                          child: Container(
                            width: 250,
                            height: 50,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xE5C8A4A4),
                              borderRadius: BorderRadius.circular(356),

                            ),
                            child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,

                                children: [
                                  Text(
                                    'sign up',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontFamily: 'WendyOne',
                                      fontWeight: FontWeight.w600,

                                    ),
                                  ),
                                ]
                            ),
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
    );
  }
}