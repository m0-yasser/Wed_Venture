import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
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
                  padding: EdgeInsets.only(top: 12),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
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
            height: 60,
            color: Color.fromRGBO(201, 165, 165, 1),
            padding: EdgeInsets.only(top: 10),
            child: Center(
              child: Text(
                'Chat With Us!',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'worksans',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            width: 400,
            height: 55,
            color: Color.fromRGBO(201, 165, 165, 1),
            padding: EdgeInsets.only(top: 10),
            child: Center(
              child: Text(
                'An AI chat bot that will help you in your journey',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'worksans',
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),


          ElevatedButton(
            onPressed:()=> setState(() {
              launchUrl(Uri.parse('https://creator.voiceflow.com/prototype/662a8257fc08cf2d1430c752'));
              }
            ),
            child: const Text('Visit Website'),
          ),


          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Colors.white),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Type your message...',
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
