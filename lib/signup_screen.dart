import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  String email = "";
  String passowrd = "";
  String phone_number = "";
  String user_name = "";
  Function setUserDetailsIfCorrect;
  SignUpScreen(this.setUserDetailsIfCorrect);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                  labelText: 'Full Name',
                  hintText: 'Enter Full Name'),
              onChanged: (value) {
                setState(() {
                  widget.user_name = value;
                });
              },
            ),
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
                  labelText: 'Phone Number',
                  hintText: 'Enter Phone Number'),
              onChanged: (value) {
                setState(() {
                  widget.phone_number = value;
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
                child: Text("Signup"),
                onPressed: () {
                  // API_CALL signup
                  // widget.setUserDetailsIfCorrect(
                  //     widget.user_name, widget.email, widget.phone_number, "");
                  Navigator.of(context).pushNamed("/home_screen");
                }),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed("/login_screen");
              },
              child: Text("Already have account?Login"),
            )
          ],
        ),
      ),
    );
  }
}
