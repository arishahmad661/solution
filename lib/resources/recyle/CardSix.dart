import 'package:flutter/material.dart';
import 'package:solution_own/resources/recyle/recycle.dart';

class CardSix extends StatelessWidget {
  String? write;
  CardSix(this.write,{super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(write!),),

      body: FutureBuilder(
        future: getRecycleData(),
        builder: (context, snapshot) {
          
          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                                       TextWidget(
                        "Even though organic waste recycling is a novice and important method of waste recycling, there are some challenges that limit the use of recycling methods."),
                        Text(" Some of the most prominent barriers or challenges of organic waste recycling are:-"),
                       ListBuilder(significance, 10, 5),
                        
                  ])
              ));
          }
          
else if (snapshot.connectionState == ConnectionState.none) {
            return Container();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
            }  }
      ),
    );
  }
}