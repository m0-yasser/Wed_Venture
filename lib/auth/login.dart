import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Loginstate();
}

class _Loginstate extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late final String? Function(String?) validator = (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required.';
              }
              return null;
            };
  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if(googleUser == null){
      return;
    }
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
     await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.of(context).pushNamedAndRemoveUntil("Home", (route) => false);
  }


  @override
  void dispose() {
    // Dispose the controllers when the widget is disposed to free up resources
    email.dispose();
    password.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
      children: [
        Form(
          key: formState,
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/bg.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: const Color(0xE5C8A4A4).withOpacity(0.6),
                    ),
                  ),
                ),


                const Positioned(
                  left: 70,
                  top: 90,
                  child: SizedBox(
                    width: 250,
                    height: 75,
                    child: Text(
                      'Login to Your Account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 33,
                        fontFamily: 'WendyOne',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: -0,
                  top: 90,
                  child: SizedBox(
                    width: 424,
                    height: 796,
                    child: Stack(
                      children: [
                        // the rectangle of the Email...
                        Positioned(
                          left: 50,
                          top: 125,
                                     child: Container(
                                        width: 300,
                                        height: 49,
                                        padding: const EdgeInsets.all(12),
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFFF8F8F8),
                                          shape: RoundedRectangleBorder(
                                            side: const BorderSide(width: 1,
                                                color: Color(0xFFB2B2B1)),
                                            borderRadius: BorderRadius.circular(
                                                16),
                                          ),
                                        ),

                                        child: TextFormField(
                                          validator: validator,
                                          controller: email,
                                          decoration: const InputDecoration(
                                            floatingLabelBehavior: FloatingLabelBehavior.never,
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
                                            color: Colors.black, fontSize: 20,),
                                          // Add validation and saving logic here
                                        ),
                                      ),
                                  ),

                        // the rectangle of the password....
                        Positioned(
                          left: 55,
                          top: 215,
                          child: Container(
                            width: 295,
                            height: 49,
                            padding: const EdgeInsets.all(12),
                            decoration: ShapeDecoration(
                              color: const Color(0xFFF8F8F8),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, color: Color(0xFFB2B2B2)),
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: TextFormField(
                                validator: validator,
                              controller: password,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                  color: Color(0xFF5F5F5F),
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              obscureText: true,
                              style: const TextStyle(
                                  color: Colors.black),
                            ),
                          ),
                        ),


                        Positioned(
                          left: 120,
                          top: 290,
                          child: MaterialButton(
                            onPressed: (){Navigator.pushNamed(context, 'forget');},
                            child: const Text(
                              'Forget password ?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        // login as a btn
                        // Edited code to replace login text with a button and navigate to another page
                        Positioned(
                          left: 70, // Adjust the left position
                          top: 325, // Adjust the top position
                          child: TextButton(
                            onPressed: () async {
                              if(formState.currentState!.validate()){
                                try {

                                  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                    email: email.text,
                                    password: password.text,
                                  );
                                  if(credential.user!.emailVerified){
                                    Navigator.pushNamed(context, 'Home');
                                  }else{
                                    FirebaseAuth.instance.currentUser!.sendEmailVerification();
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.error,
                                      animType: AnimType.rightSlide,
                                      title: "Warning.",
                                      desc: 'Please Check Your E-mail to activate your Account.',
                                    ).show();
                                  }
                                } on FirebaseAuthException catch (e) {
                                  String errorMessage = 'An error occurred';
                                  if (e.code == 'user-not-found') {
                                    errorMessage = 'No user found for that email.';
                                  } else if (e.code == 'wrong-password') {
                                    errorMessage = 'Wrong password provided for that user.';
                                  }
                                  errorMessage = "E-mail/Password Entered isn't valid.";
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.error,
                                    animType: AnimType.rightSlide,
                                    title: "Not Valid.",
                                    desc: errorMessage,
                                  ).show();
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
                                      'log in',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontFamily: 'Wendy One',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ]
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 140,
                          top: 400,
                          child: Text(
                            'or continue with',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),

                        Positioned(
                          left: 170, // Adjust the left position as needed
                          top: 440, // Adjust the top position as needed
                          child: IconButton(
                            icon: Image.asset(
                              'images/google.png',
                              width: 50,
                              height: 45,
                            ),
                            onPressed: () {
                              signInWithGoogle();
                            },
                          ),
                        ),

                        Positioned(
                          left: 90,
                          top: 530,
                          child: Row(
                            children: [
                              Text(
                                'Don’t have an account?',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.7900000214576721),
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              MaterialButton(onPressed: () { Navigator.pushNamed(context, 'signup'); },
                                child: const Text(
                                  'Sign Up' ,
                                  style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,),
                              )
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ),
        ],
        )
        )
    );
  }
}