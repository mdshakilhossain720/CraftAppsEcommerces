import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ReviewShowScreen extends StatefulWidget {
  const ReviewShowScreen({super.key});

  @override
  State<ReviewShowScreen> createState() => _ReviewShowScreenState();
}

class _ReviewShowScreenState extends State<ReviewShowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,

                  itemBuilder: (context,index){
                    return Container(
                      height: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.account_circle,size: 40,),
                          Column(
                            children: [
                              Text("Bangladesh is a good courtnty",style: TextStyle(
                                  fontSize: 15,color: Colors.black,
                                  fontWeight: FontWeight.w500
                              ),),
                              SizedBox(height: 4,),
                              Text("Ther Product is gthe good",style: TextStyle(
                                fontSize: 12,color: Colors.black,
                              ),),
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),

    );
  }
}