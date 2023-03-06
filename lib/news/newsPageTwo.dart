import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:solution_own/news/news.dart';

class NewsPageTwo extends StatelessWidget {

  int? index;

  NewsPageTwo(this.index,
      {super.key});
  var url =
      "https://newsdata.io/api/1/news?apikey=pub_1825434dc43f845b2b37bf075ca5b3cd7d8e8&q=climate%20AND%20environment&language=en&category=environment ";
  var dataa;
  getNews() async {
    var res = await http.get(Uri.parse(url));
    dataa = jsonDecode(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: getNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.network(imagee!),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      child: dataa['results'][index]['image_url'].toString() != 'null'
                          ? Image.network(
                              dataa['results'][index]['image_url'].toString(),
                              fit: BoxFit.fitHeight,
                            )
                          : Image.asset("assets/noimage.png",fit: BoxFit.fitHeight,),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0, right: 8.0,bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                    Text(dataa['results'][index]['pubDate'].toString() ,style: TextStyle(color: Colors.grey),),
                        Text(dataa['results'][index]['creator'] == null
                                ? "Unkown"
                                : dataa['results'][index]['creator'][0]
                                    .toString(), style: TextStyle(color: Colors.grey),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:16.0,right:16.0,),
                    child: Text(dataa['results'][index]['title'].toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(dataa['results'][index]['description'].toString(),
                    style: TextStyle(
                      fontSize: 15
                    ),),
                  ),


                        Padding(
                          padding: const EdgeInsets.only(left:16.0, right: 16.0),
                          child: Text( dataa['results'][index]['content'].toString() == "null" ? "" : dataa['results'][index]['content'].toString()),
                        )

                ],
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.none) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
