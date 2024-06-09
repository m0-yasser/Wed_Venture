import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class accinfo extends StatefulWidget{
 // const accinfo({super.key});
  const accinfo({Key? key}) : super(key: key);
  @override
  _accinfoState createState() => _accinfoState();
}

class _accinfoState extends State<accinfo>{

final currentuser = FirebaseAuth.instance.currentUser!;

List <QueryDocumentSnapshot> data = [];

getdata() async {
  QuerySnapshot querySnapshot =
  await FirebaseFirestore.instance.collection('Users').get();
  setState(() {
    data = querySnapshot.docs;
  });
}
@override
  void initState(){
  getdata();
      super.initState();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, i){
          return Column(
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
                          Navigator.pop(context); // Navigates back to the previous screen
                        },
                        color: Colors.black, // Set icon color
                      ),
                    ),
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
                    'Account Info',
                    style: TextStyle(
                      fontSize: 35,
                      fontFamily: 'worksans',//  font size
                      fontWeight: FontWeight.bold, // Make text bold
                      color: Colors.white, //  text color
                    ),
                  ),
                ),
              ),
              Icon(Icons.person_outlined, size: 100,),
              Text(
                currentuser.email!,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'WorkSans'
                ),
              ),

              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    '   Full Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.settings, color: Colors.white,))
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 60,
                margin: EdgeInsets.only(left: 20, right: 20,),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    "${data[i]['full_name']}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Text(
                    '   User Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.settings, color: Colors.white,))

                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 60,
                margin: EdgeInsets.only(left: 20, right: 20,),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    "${data[i]['username']}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    '   Phone Number',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.settings, color: Colors.white,))
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 60,
                margin: EdgeInsets.only(left: 20, right: 20,),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    "${data[i]['Phone number']}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

            ],
          );
        },

      ),
    );
  }
}