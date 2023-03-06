import 'package:flutter/material.dart';
import 'package:solution_own/news/news.dart';
import 'package:solution_own/resources/recyle/RecyclePageOne.dart';
import 'package:solution_own/resources/first.dart';
import 'package:solution_own/resources/recyle/recycle.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawwer(),
      appBar: AppBar(),
      body: Scaffold(),
    );
  }
}

class drawwer extends StatelessWidget {
  const drawwer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ListTile(title: Text("News"), onTap: (){
            Navigator.push(
                  context, MaterialPageRoute(builder: (context) => 
        News()
                   ));
          },),
          ListTile(title: Text("R.R.R."),onTap: (){
            Navigator.push(
                  context, MaterialPageRoute(builder: (context) => 
       First()
                   ));
          },),
        ],
      ),
    );
  }
}

