import 'package:flutter/material.dart';

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
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(40.0),
        child: Form(
          autovalidate: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Enter Email", fillColor: Colors.white),
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                decoration: InputDecoration(
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
                child: Icon(Icons.login),
                onPressed: () {
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
