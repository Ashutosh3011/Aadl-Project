import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreviewScreen extends StatefulWidget {
  // final String img64;
  final String meetingWith;
  final String timeToMeet;
  final String reason;

  // PreviewScreen(this.name, this.meetingWith, this.timeToMeet, this.reason);
  final String name;
  const PreviewScreen(
      this.name, this.meetingWith, this.timeToMeet, this.reason);

  @override
  _PreviewScreenState createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  String img64 = "";
  var img;
  SharedPreferences _sharedPreferences;
  @override
  void initState() {
    initializeSharedPref();
    super.initState();
    print("object");
  }

  void initializeSharedPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    img64 = _sharedPreferences.getString('img64') ?? null;
    // print(img64);
    img = base64Decode(img64);
  }

  @override
  Widget build(BuildContext context) {
    initializeSharedPref();
    print("//////////////////////////////////////////////////" + img64);
    // final PreviewScreen args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        alignment: Alignment.topLeft,
        child: Column(
          children: <Widget>[
            Image.memory(img, height: 300, width: 300),
            Text(
              "Name of Visitor : " + widget.name,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Who to Meet : " + widget.meetingWith,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Meeting time: " + widget.timeToMeet,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Reason : " + widget.reason,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  // Future<ByteData> getBytesFromFile() async {
  //   Uint8List bytes = File(widget.imgPath).readAsBytesSync() as Uint8List;
  //   return ByteData.view(bytes.buffer);
  // }
}
