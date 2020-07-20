import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterappnews/news/homepage.dart';
import 'package:flutterappnews/qrgenerator/generator.dart';
import 'package:flutterappnews/setup/singUp.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}


class _LoginPageState extends State<LoginPage>{
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(
        title: Text('Authorization'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
              TextFormField(
                validator: (input){
                  if( input.isEmpty){
                    return 'Please type an email';
                  }
                },
                onSaved: (input) => _email = input,
                decoration: InputDecoration(
                  labelText: 'Email'
                ),
              ),
            TextFormField(
              validator: (input){
                if( input.length < 6){
                  return 'Your password needs to be atleast 6 characters';
                }
              },
              onSaved: (input) => _password = input,
              decoration: InputDecoration(
                  labelText: 'Password'
              ),
              obscureText: true,
            ),

            RaisedButton(
              onPressed:  () async {
                if(_formKey.currentState.validate()){
                  _formKey.currentState.save();
                  try {
                    FirebaseUser user =
                        (await FirebaseAuth.instance.signInWithEmailAndPassword(
                          // login = user@user.com
//                          123456

                          email: _email,
                          password: _password,
                        )).user;
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(_email)));
                  } catch (e) {
                    print(e);
                  }
                }
              },
              child: Text('Sign in'),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
              },
              child: Text('Sign up'),
            )
          ],
        ),
      ),
    );
  }
}

