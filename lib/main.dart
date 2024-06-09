import 'package:flutter/material.dart';
import 'package:wedventure_3/WelcomePage.dart';
import 'package:wedventure_3/auth/forgetpassword.dart';
import 'package:wedventure_3/auth/resetpassword.dart';
import 'package:wedventure_3/auth/signup.dart';
import 'package:wedventure_3/auth/login.dart';
import 'package:wedventure_3/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wedventure_3/categories/Appointment.dart';
import 'package:wedventure_3/categories/D-suits.dart';
import 'package:wedventure_3/categories/D_dress.dart';
import 'package:wedventure_3/categories/D_halls.dart';
import 'package:wedventure_3/categories/D_photo.dart';
import 'package:wedventure_3/categories/Dresses.dart';
import 'package:wedventure_3/categories/dressshop.dart';
import 'package:wedventure_3/categories/suits.dart';
import 'package:wedventure_3/navbar/Booking.dart';
import 'package:wedventure_3/navbar/accountinfo.dart';
import 'package:wedventure_3/navbar/favourite.dart';
import 'package:wedventure_3/navbar/profil.dart';
import 'auth/login.dart';
import 'auth/signup.dart';
import 'categories/MakeupArtist.dart';
import 'categories/halls.dart';
import 'categories/payment.dart';
import 'categories/photographer.dart';
import 'categories/suitshop.dart';
import 'firebase_options.dart';
import 'navbar/inbox.dart';
import 'package:app_links/app_links.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';



Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState(){
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('=========User is currently signed out!');
      }
      else {
        print('=========User is signed in!');
        }
      }
    );
  }


@override
Widget build(BuildContext context) {
  return MaterialApp(
    theme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: const Color.fromRGBO(201, 165, 165, 1),
    ),
    debugShowCheckedModeBanner: false,
    home:  Welcome_p(),
    routes: {
      "signup" : (context) =>  SignUp() ,
      "welcome" : (context) =>  Welcome_p() ,
      "login" : (context) =>  Login(),
      "forget" : (context) =>  forget(),
      "reset" : (context) =>  reset(),
      "Home" : (context) =>  HomePage(),
      "photographer" : (context) =>  Photographer(),
      "Suits" : (context) =>  Suits(),
      "dress" : (context) =>  dress(),
      "Suit-shop" : (context) =>  Suitshop(),
      "dress-shop" : (context) =>  Dress_shop(),
      "Dsuit" : (context) =>  Dsuits(),
      "Ddress" : (context) =>  Ddress(),
      "Dhalls" : (context) =>  Dhalls(),
      "Dphoto" : (context) =>  Dphoto(),
      "Halls" : (context) =>  halls(),
      "Makeup" : (context) =>  MakeupArtist(),
      "suitDetails" : (context) =>  Dsuits(),
      "profile" : (context) =>  profil(),
      "chat" : (context) => ChatScreen(),
      "booking" : (context) =>  Booking(),
      "Fav" : (context) =>  Fav(),
      "payment" : (context) =>  payment(),
      "appoint" : (context) =>  appoint(),
      "accinfo" : (context) =>  accinfo()


    },
  );
}
}


















