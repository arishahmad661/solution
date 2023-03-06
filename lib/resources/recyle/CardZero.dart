import 'package:flutter/material.dart';
import 'package:solution_own/resources/recyle/recycle.dart';

class CardZero extends StatelessWidget {
    String? write;
  CardZero(this.write,{super.key});
  

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
                    const Text(
                      "Organic waste recycling (methods, steps, significance, barriers)",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(titles![0]),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: const Icon(
                              Icons.circle,
                              size: 10,
                            ),
                            title: Text(
                              about_organowaste![index],
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