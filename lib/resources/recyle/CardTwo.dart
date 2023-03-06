import 'package:flutter/material.dart';
import 'package:solution_own/resources/recyle/recycle.dart';

class CardTwo extends StatelessWidget {
  String? write;
  CardTwo(this.write,{super.key});
  
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
                    TextWidget("What is organic waste recycling?"),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 9,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: const Icon(
                              Icons.circle,
                              size: 10,
                            ),
                            title: Text(
                              about_organowaste![index + 13],
                              style: const TextStyle(fontSize: 13),
                            ),
                          );
                        }),
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