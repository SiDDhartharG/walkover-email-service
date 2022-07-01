import 'package:flutter/material.dart';
import 'package:first_flutter_app/structure/user_info.dart';

class Profile extends StatefulWidget {
  @override
  UserInfo userInfo;
  Profile(this.userInfo);
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.account_circle_outlined,
              size: 100,
            ),
            SizedBox(
              height: 20,
            ),
            Text("Name"),
            Text(
              widget.userInfo.userName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Email"),
            Text(
              widget.userInfo.userEmail,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Phone Number"),
            Text(
              widget.userInfo.userPhoneNumber,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
