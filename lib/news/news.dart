import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:solution_own/main.dart';

import 'newsCard.dart';

class News extends StatefulWidget {
  News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> with TickerProviderStateMixin{
  List? titlee;

  var apikeyy = Get API key from 'https://newsdata.io/' ;
  var url1, url2, url3;

  var data1, data2, data3;

 
  getNews() async {
  url1 = "https://newsdata.io/api/1/news?apikey=$apikeyy&language=en&category=environment ";
   url2 ="https://newsdata.io/api/1/news?apikey=$apikeyy&q=environment%20OR%20temperature%20OR%20trees%20OR%20global%20warming&language=en&category=environment ";
  url3 ="https://newsdata.io/api/1/news?apikey=$apikeyy&q=climate&language=en&category=environment ";

    var res1 = await http.get(Uri.parse(url1));
    data1 = jsonDecode(res1.body);

    var res2 = await http.get(Uri.parse(url2));
    data2 = jsonDecode(res2.body);

    var res3 = await http.get(Uri.parse(url3));
    data3 = jsonDecode(res3.body);
  }

late TabController _tabController;

    @override
    void initState() {
      super.initState();
      _tabController = TabController(length: 3, vsync: this);
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawwer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: DefaultTabController(
            length: 3,
            child:
                TabBar(
                   controller: _tabController,
                  indicatorColor: Colors.
                  amber, isScrollable: true, tabs:const [
              Text("Top", style: TextStyle(color: Colors.amber)),
              Text("Environment", style: TextStyle(color: Colors.amber)),
              Text("Climate", style: TextStyle(color: Colors.amber)),
            ]),
          ),
        ),
        title: const Text("News"),
      ),
      body: FutureBuilder(
          future: getNews(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: data1['results'].length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 100,
                      child: TabBarView(  controller: _tabController,
                        children: [
                        // Top(titlee![index]),
                        Top(
                          data1['results'][index]['title'].toString(),
                          data1['results'][index]['image_url'].toString(),
                          data1['results'][index]['creator'] == null
                              ? "Unkown"
                              : data1['results'][index]['creator'][0]
                                  .toString(),
                          data1['results'][index]['pubDate'].toString(),
                          index,
                        ),
                        Top(
                          data2['results'][index]['title'].toString(),
                          data2['results'][index]['image_url'].toString(),
                          data2['results'][index]['creator'] == null
                              ? "Unkown"
                              : data2['results'][index]['creator'][0]
                                  .toString(),
                          data2['results'][index]['pubDate'].toString(),
                          index,
                        ),
                        Top(
                          data3['results'][index]['title'].toString(),
                          data3['results'][index]['image_url'].toString(),
                          data3['results'][index]['creator'] == null
                              ? "Unkown"
                              : data3['results'][index]['creator'][0]
                                  .toString(),
                          data3['results'][index]['pubDate'].toString(),
                          index,
                        ),
                      ]),
                    );
                  });
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
