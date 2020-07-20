import 'package:flutter/material.dart';
import 'package:flutterappnews/setup/signIn.dart';



void main(){
   runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'Authorization',
      theme: new ThemeData(
          primaryColor: Colors.blue,
      ),
      home: new LoginPage(),
    );
  }

}
