import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  @override
  Widget build(BuildContext context) {
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
