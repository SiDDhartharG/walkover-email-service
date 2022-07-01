import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/login_screen");
                },
                child: Text("Login")),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/signup_screen");
                },
                child: Text("SignUp"))
          ]),
    );
  }
}
