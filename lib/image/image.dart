import 'dart:io';
import 'package:flutter/material.dart';
import 'file:///Users/nazarkovalik/Documents/GitHub/flutterTest/lib/image/image_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;


class LandeigScreen extends StatefulWidget {
  @override
  _LandeigScreenState createState() => _LandeigScreenState();
}

Future<ImageMadel> createUser(File image) async {
  final String apiUrl = "https://flutter-test.redentu.com/";
  final response = await http.post(apiUrl, body:{"message": image});

  if(response.statusCode == 201){
    final String responseString = response.body;
    return imageMadelFromJson(responseString);
  } else {
    return null;
  }
}

class _LandeigScreenState extends State<LandeigScreen> {
  File imageFile;
  ImageMadel _image;
  final picker = ImagePicker();
  _openGallary(BuildContext context) async{
    // ignore: deprecated_member_use
    var picture = await picker.getImage(source: ImageSource.gallery);
    this.setState((){
      this.setState((){
        imageFile = File(picture.path);
      });
    });
    Navigator.of(context).pop();
  }
  _openCamera(BuildContext context) async{
    // ignore: deprecated_member_use
    var picture = await picker.getImage(source: ImageSource.camera);
    this.setState((){
      this.setState((){
        imageFile = File(picture.path);
      });
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(context: context, builder: (BuildContext context){

      return AlertDialog(
        title: Text('Male a Choice'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text('Gallary'),
                onTap: (){
                  _openGallary(context);
                },
              ),
              Padding(padding: EdgeInsets.all(8.0),),
              GestureDetector(
                child: Text('Camera'),
                onTap: (){
                  _openCamera(context);
                },
              ),
            ],
          ),
        ),
      );
    });
  }
  Widget _decideImageView() {
    if (imageFile == null){
      return Text("No Image Selected!");
    } else {
      return Image.file(imageFile,width: 400, height: 400,);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Screen"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: <Widget>[
              _decideImageView(),
              RaisedButton(onPressed: (){
                _showChoiceDialog(context);
              },child: Text("Select Image"),),
              RaisedButton(onPressed: () async{
                final ImageMadel image = await createUser(imageFile);
                setState(() {
                  _image = image;
                });
              },child: Text("Post"),),
              SizedBox(height: 32,),
            ],
          ),
        ),
      ),
    );
  }
}
