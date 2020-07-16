import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';

class GeneratorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GeneratorPageState();
}

class GeneratorPageState extends State<GeneratorPage> {
    String image =  "";
    final qrData = TextEditingController();
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('QR'),
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
              child: SizedBox(
                height: 200.0,
                width: 200.0,
                child: QrImage(
                  data: image,
                ),
              ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: qrData,
                decoration: InputDecoration(
                  hintText: "Введіть свій текс",
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: FlatButton(
                  onPressed: () async {
                    if (qrData.text.isEmpty) {
                      setState(() {
                        image = "";
                      });
                    } else {
                      setState(() {
                        image = qrData.text;
                      });
                    }
                  },
                  child: Text(
                    "Генерувати",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 2.0),
                    ),
                ),
              )
            ],
          ),
        ),
      );
    }
}