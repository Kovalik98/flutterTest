import 'package:flutter/material.dart';
import 'package:flutterappnews/news/detailpage.dart';
import 'package:flutterappnews/qrgenerator/generator.dart';

import 'news.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
 String tytle;
 HomePage(this.tytle);
  @override
  _HomePageState createState() => _HomePageState(tytle: tytle);
}

class _HomePageState extends State<HomePage>{
  String tytle;
  _HomePageState({this.tytle});
  bool loadingInProgress;
  var newslist;
  void getNews() async {
    News news = News();
    await news.getNews();
    newslist = news.news;
    setState(() {
      loadingInProgress = false;
      newslist = news.news;
    });
  }

  @override
  void initState() {
    loadingInProgress = true;
    super.initState();
    getNews();
  }
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(tytle),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.blur_on),
            onPressed: () {
              Navigator.of(context).push(_createRoute());
            },
          ),
          IconButton(
            icon: const Icon(Icons.add_a_photo),
            onPressed: () {

            },
          ),
        ],
      ),

      body: SafeArea(child: Padding(padding: EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
        child: loadingInProgress ? Center(child: Text('Loading...'),)
            : Column(
          children: <Widget>[

            Divider(),

            Expanded(

              child: ListView.builder(
                itemCount: newslist.length,
                itemBuilder: (context, index){

                  return ListTile(
                    title: Text( newslist[index].title),
                    subtitle: Text(DateFormat.Hm().format(newslist[index].publishedAt),),
                    leading: Container(
                      width: 100,
                      height: 100,
                      child: Image.network(newslist[index].urlToImage),
                    ),

                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DetailPage(newslist[index]))
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => GeneratorPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}