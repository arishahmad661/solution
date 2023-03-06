import 'package:flutter/material.dart';
import 'package:solution_own/resources/recyle/recycle.dart';

class CardThree extends StatelessWidget {
  String? write;
  CardThree(this.write,{super.key});
  
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
                    Image.network(
                        "https://microbenotes.com/wp-content/uploads/2020/11/Organic-waste-recycling.jpeg"),
                    TextWidget("Methods of organic waste recycling"),
                    Text(
                      "There are different methods of organic waste recycling, each of which can be used for a particular group of waste to produce some form of useful organic matter. ",
                    ),
                    Text("Some of the common methods are described below:-"),
                    TextWidget("1. Animal feed"),
                    ListBuilder(about_organowaste!, 23, 7),
                    TextWidget("2. Composting"),
                    ListBuilder(about_organowaste, 30, 8),
                    TextWidget("3. Anaerobic digestion"),
                    ListBuilder(about_organowaste, 38, 5),
                    TextWidget("4. Rendering"),
                    ListBuilder(about_organowaste, 43, 6),
                    TextWidget("5. Rapid thermophilic digestion"),
                    ListBuilder(about_organowaste, 51, 4),
                    TextWidget("6. Immobilized enzyme reaction"),
                    ListBuilder(about_organowaste, 55, 8),
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