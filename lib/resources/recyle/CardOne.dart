import 'package:flutter/material.dart';
import 'package:solution_own/resources/recyle/recycle.dart';

class CardOne extends StatelessWidget {
  String? write;
  CardOne(this.write,{super.key});
  
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
                        "Organic wastes have been an important source of pollution in the environment."),
                    const SizedBox(
                      height: 10,
                    ),
                    TextWidget(
                      "Some of the common types of organic wastes usually found in nature include the following:-",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextWidget(
                      titles![1],
                    ),
                    ListBuilder(about_organowaste!, 6, 2),
                                                           TextWidget(titles![2]),
                    ListBuilder(about_organowaste!, 8, 3),
                                                                            TextWidget(
                      titles![3],
                    ),
                    ListBuilder(about_organowaste!, 11, 3),
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