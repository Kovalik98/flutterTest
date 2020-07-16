import 'package:flutter/material.dart';
import 'package:flutterappnews/news/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _LoginPageState();
 }


  class _LoginPageState extends State<LoginPage>{

  final formKey = GlobalKey<FormState>();

  String _email;
  String _password;

  bool validateAndSave(){
      final form = formKey.currentState;
      if (form.validate()) {
        form.save();
        return true;
      }
      return false;
  }
  void validateAndSubmit() async {
    if (validateAndSave()) {
      if (_email == 'User' && _password == '123456') {
      Navigator.of(context).push(_createRoute());

      } else{
        print('no');
      }
    }
  }

  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(
          title: Text('Authorization'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
                onSaved: (value) => _email = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                  validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
                  onSaved: (value) => _password = value,
    ),
              RaisedButton(
                child: Text('Login', style: TextStyle(fontSize: 20.0)),
                onPressed: validateAndSubmit,
              )
            ],
          ),
        )
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}


