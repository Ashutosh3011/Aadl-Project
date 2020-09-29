import 'package:aadlProject/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'camera_screen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mobile = TextEditingController();
    final password = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(50),
        child: Form(
          autovalidate: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Login",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                controller: mobile,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mobile Number',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Password",
                ),
                obscureText: true,
                keyboardType: TextInputType.text,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
              ),
              MaterialButton(
                height: 50.0,
                minWidth: 150.0,
                color: Colors.green,
                splashColor: Colors.blue,
                textColor: Colors.white,
                child: Icon(Icons.forward),
                onPressed: () {
                  print("Mobile Number : " + mobile.text);
                  print("Password : " + password.text);
                  if (mobile.text.length != 10) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => CupertinoAlertDialog(
                              title: new Text("ALERT!!"),
                              content: new Text(
                                  "Please enter a valid mobile number and password"),
                              actions: <Widget>[
                                CupertinoDialogAction(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("ok"),
                                )
                              ],
                            ));
                  } else {
                    PostServices.insertData(mobile.text, password.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CameraScreen()),
                    );
                  }

                  print("Logged in");
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
