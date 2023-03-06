import 'package:flutter/material.dart';
import 'package:solution_own/resources/recyle/recycle.dart';

class CardFive extends StatelessWidget {
  String? write;
  CardFive(this.write,{super.key});
  
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
                        "Organic waste recycling has multiple advantages that help prevent the problems that arise with the accumulation of waste products in nature."),
                        Text("Some of the common advantages or significances of organic waste recycling are:-"),
                       ListBuilder(significance, 0, 10),
                        
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