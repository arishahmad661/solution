import 'package:flutter/material.dart';
import 'package:solution_own/resources/recyle/CardFive.dart';
import 'package:solution_own/resources/recyle/CardFour.dart';
import 'package:solution_own/resources/recyle/CardOne.dart';
import 'package:solution_own/resources/recyle/CardSix.dart';
import 'package:solution_own/resources/recyle/CardThree.dart';
import 'package:solution_own/resources/recyle/CardTwo.dart';
import 'package:solution_own/resources/recyle/recycle.dart';

import 'CardZero.dart';

List<String> navigation = [

];

class RecyclePageOne extends StatelessWidget {
  const RecyclePageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      // drawer: Drawer(),
      appBar: AppBar(title: Text("Recycle"), centerTitle: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RecycleCard("Organic waste recycling",0),
              RecycleCard("Types of organic wastes ",1),
              RecycleCard("What is organic waste recycling?",2),
              RecycleCard("Methods of organic waste recycling",3),
              RecycleCard("Process of organic waste recycling",4),
              RecycleCard("Significance of organic waste recycling",5),
              RecycleCard("Barriers and Challenges of organic waste recycling",6)
            ],
          ),
        ),
      ),
    );
  }
}

class RecycleCard extends StatelessWidget {
  String? write;
  int? indx;
  RecycleCard(this.write,this.indx,{super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: InkWell(
        onTap: (){
                  Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context) => 
                     indx==0 ? CardZero(write) :
                     indx==1 ? CardOne(write) :
                     indx==2 ? CardTwo(write) :
                     indx==3 ?CardThree(write):
                     indx==4 ? CardFour(write):
                     indx==5 ? CardFive(write) :
                     CardSix(write)
                    )
                  );
        },
        child: SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 10,
                    child: Center(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(write!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    )),
                  ),
                ),
      ),
    );
  }
}