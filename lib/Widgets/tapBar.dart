import 'package:flutter/material.dart';

class appBar extends StatelessWidget {
  const appBar({super.key, required this.pageName});
  final String pageName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 28),
      height: 151,
      //width: 200,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(color: Colors.black, Icons.arrow_back),
            ),
          ],
        ),
        const Divider(
          color: Colors.white,
          thickness: 1.0,
        ),
        Center(
          child: Text(
            pageName,
            style: const TextStyle(fontSize: 30,color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'WorkSans'),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Center(
          child:
          Container(
              width: 300,
              height: 40,
              decoration: BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.circular(30)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search_rounded, color: Colors.black12),
                  Text("Search...",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Colors.black12),)
                ],)
          ),
        )
      ]),
    );
  }
}