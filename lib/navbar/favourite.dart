import 'package:flutter/material.dart';

import '../Widgets/tapBar.dart';
//import 'package:percent_indicator/percent_indicator.dart';



class Fav extends StatefulWidget {
  const Fav({super.key});

  @override
  _FavState createState() => _FavState();
}

class _FavState extends State<Fav> {
  @override
  Widget build(BuildContext context) {
   return const Scaffold(
     body: SingleChildScrollView(
       child: Column(
         children: [
           appBar(pageName: 'Favourites'),

         ],
       ),
     ),
   );
  }
}

