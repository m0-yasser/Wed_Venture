import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wedventure_3/Onboarding/intro1.dart';
import 'package:wedventure_3/Onboarding/intro2.dart';
import 'package:wedventure_3/Onboarding/intro3.dart';
import 'package:wedventure_3/Onboarding/intro4.dart';

import 'intro5.dart';

class board extends StatefulWidget{
  const board({super.key});

  @override
  _boardState createState() => _boardState();
}

class _boardState extends State<board>{

  final PageController _controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
          onPageChanged: (index){
              setState(() {
                onLastPage = (index == 4);
              });
          },
          children: const [
            intro1(),
            intro2(),
            intro3(),
            intro4(),
            intro5(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(4);
                    },
                      child: const Text('Skip')
                  ),

                  SmoothPageIndicator(controller: _controller, count: 5),

                  onLastPage?
                  GestureDetector(
                      onTap: () {
                       Navigator.pushNamed(context, 'login');
                      },
                      child: const Text('Done')
                  ) : GestureDetector(
                      onTap: () {
                        _controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                      },
                      child: const Text('Next')
                  ) ,
                ],
              )),
        ]
      ),
    );
  }
}