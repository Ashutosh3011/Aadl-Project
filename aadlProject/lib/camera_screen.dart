import 'dart:convert';
import 'dart:io';
import 'dart:io' as Io;
import 'package:aadlProject/database.dart';
import 'package:aadlProject/home.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State {
  var image;
  String img64 = "";
  SharedPreferences _sharedPreferences;
  final picker = ImagePicker();
  final name = TextEditingController();
  final meetingWith = TextEditingController();
  final timeToMeet = TextEditingController();
  final reason = TextEditingController();

  @override
  void initState() {
    initializeSharedPref();
    super.initState();
  }

  void initializeSharedPref() async {
    // SharedPreferences.setMockInitialValues({});
    _sharedPreferences = await SharedPreferences.getInstance();
    img64 = _sharedPreferences.getString('img64') ?? null;
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
        final bytes = Io.File(pickedFile.path).readAsBytesSync();
        img64 = base64Encode(bytes);
        // final bytes = await Io.File(image).readAsBytes();
        // String base64Encode(List<int> bytes) => base64.encode(bytes);
        _sharedPreferences.setString('img64', img64);
        print(img64);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(50),
          alignment: Alignment.center,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.ri,
            children: [
              SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.amber),
                child: image == null
                    ? IconButton(
                        icon: Icon(Icons.add_a_photo),
                        onPressed: () {
                          getImage();
                        })
                    : Image.file(
                        image,
                        height: 250,
                        width: 250,
                        fit: BoxFit.fill,
                      ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: name,
                // obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: meetingWith,
                // obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Who to meet?',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: timeToMeet,
                // obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'When to Meet?',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: reason,
                // obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Reason to meet',
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(name.text);
          print(meetingWith.text);
          print(timeToMeet.text);
          print(reason.text);
          PostServices.registerData(
              name.text, meetingWith.text, timeToMeet.text, reason.text);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PreviewScreen(
                    name.text, meetingWith.text, timeToMeet.text, reason.text)),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
