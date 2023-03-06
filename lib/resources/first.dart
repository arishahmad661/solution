import 'package:flutter/material.dart';
import 'package:solution_own/resources/recyle/recycle.dart';

import '../main.dart';
import 'recyle/RecyclePageOne.dart';

class First extends StatelessWidget {
  const First({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawwer(),
      appBar: AppBar(
        title: Text("Resources"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 19,),
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 15,),
              
                    SizedBox(
                      height: 150,
                      width: 170,
                      child: Image.asset('assets/resource/reuse.png')
                    ),
                    Text("Reuse"),
                  ],
                ),
              ),
                    SizedBox(height: 19,),

              Card(
                elevation: 10,
                 shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),               
                child: Column(
                  children: [
                    SizedBox(height: 15,),

                    SizedBox(
                      height: 150,
                      width: 170,
                      child: Image.asset('assets/resource/reduce.png')
                    ),
                    Text("Reduse"),
                  ],
                ),
              ),
                    SizedBox(height: 19,),

              InkWell(
                onTap: (){
                  Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context) => 
                      RecyclePageOne()
                    )
                  );
                },
                child: Card(
                                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  elevation: 10,
                  child: Column(
                    children: [
                      SizedBox(height: 15,),
              
                      SizedBox(
                        height: 150,
                        width: 170,
                        child: Image.asset('assets/resource/recycle.png')
                      ),
                      Text("Recycle"),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

