import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  String email = "", passowrd = "";
  Function setUserDetailsIfCorrect;
  LoginScreen(this.setUserDetailsIfCorrect);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed("/");
              },
              child: Text("Home Screen"),
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter Email'),
              onChanged: (value) {
                setState(() {
                  widget.email = value;
                });
              },
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter Password'),
              onChanged: (value) {
                setState(() {
                  widget.passowrd = value;
                });
              },
            ),
            SizedBox(height: 20),
            RaisedButton(
                child: Text("Login"),
                onPressed: () {
                  // API_CALL login
                  Navigator.of(context).pushNamed("/home_screen");
                }),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed("/signup_screen");
              },
              child: Text("Create new account?SignUp"),
            )
          ],
        ),
      ),
    );
  }
}
