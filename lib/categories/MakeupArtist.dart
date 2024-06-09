import 'package:flutter/material.dart';
import 'package:wedventure_3/Widgets/Navigationbar.dart';
import 'package:wedventure_3/Widgets/tapBar.dart';
import 'package:wedventure_3/Widgets/data.dart';
import 'D-makeup.dart';

class MakeupArtist extends StatefulWidget {
  const MakeupArtist({super.key});
  @override
  State<MakeupArtist> createState() => _MakeupArtisitState();
}

class _MakeupArtisitState extends State<MakeupArtist>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const navigate(),
      body: SingleChildScrollView(
          child: Column(
              children: [
                appBar(pageName: 'Makeup Artists'),
                GridView.builder(
                    itemCount: makeupitmes.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisExtent:200
                    ),
                    itemBuilder: (context, i){
                      return InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Dmakeup(data: makeupitmes[i],)));
                        },
                        child: Card(
                          color: Color(0xFFC9A5A5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                width: 300,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(18), // Same radius as the container
                                  child: Image.asset(
                                    makeupitmes[i]["image"],
                                    height: 100,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Text(
                                makeupitmes[i]["title"],
                                style: TextStyle(
                                  fontFamily: 'WorkSans',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    makeupitmes[i]["subtitle"],
                                    style: TextStyle(
                                      fontFamily: 'WorkSans',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w200,
                                      color: Colors.white,
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.favorite_border),
                                    onPressed: () {
                                      // Add functionality to add to favorites
                                    },
                                    color: Colors.white,
                                  ),
                                ],
                              )

                            ],
                          ),
                        ),
                      );
                    }
                ),
              ]
          )
      ),
    );
  }
}