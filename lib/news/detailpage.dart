import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'article.dart';
import 'news.dart';

class DetailPage extends StatelessWidget {

  final Article content;

  DetailPage(this.content);




  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
          Image.network(content.urlToImage),
            Text(content.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            Container(
              padding: EdgeInsets.all(20) ,
              child: Text(content.content),
            )
          ],
        ),
      ),
    );
  }
}