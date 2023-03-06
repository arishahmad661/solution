import 'package:flutter/material.dart';
import 'package:solution_own/resources/recyle/recycle.dart';

class CardFour extends StatelessWidget {
  String? write;
  CardFour(this.write,{super.key});
  
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
                        "Process (General Steps / Mechanism) of organic waste recycling"),
                    Text(
                        "The overall process of organic waste recycling begins with the collection of waste materials which are then passed through various steps to obtain a usable form of organic matter. "),
                    Text(
                        "The general steps/ mechanism of organic waste recycling can be explained as below:-"),
                    TextWidget("1. Collection"),
                    ListBuilder(about_organowaste, 63, 3),
                    TextWidget("2. Decontamination"),
                    ListBuilder(about_organowaste, 66, 3),
                    TextWidget("3. Preparation"),
                    ListBuilder(about_organowaste, 69, 3),
                    TextWidget("4. Recycling process"),
                    ListBuilder(about_organowaste, 72, 2),
                    TextWidget("5. Screening and grading"),
                    ListBuilder(about_organowaste, 74, 2)
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