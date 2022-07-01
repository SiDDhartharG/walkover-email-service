import 'package:first_flutter_app/db/email_db.dart';
import 'package:first_flutter_app/profile.dart';
import 'package:first_flutter_app/structure/user_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:uuid/uuid.dart';

import 'compose_email.dart';
import 'structure/email.dart';
import 'home.dart';

class HomeScreen extends StatefulWidget {
  UserInfo userInfo;
  HomeScreen(this.userInfo);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  var uuid = Uuid();
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  late List<Email> allEmails = [];
  bool isLoading = false;

  Future refreshNotes() async {
    setState(() => isLoading = true);
    this.allEmails = await EmailDataBase.instance.readAllNotes();
    setState(() => isLoading = false);
  }

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => refreshNotes());
  }

  @override
  void dispose() {
    EmailDataBase.instance.close();
    super.dispose();
  }

  void addEmail(String toEmail, String emailBody) {
    setState(() {
      Email emailToAdd = Email(
          toEmail: toEmail,
          fromEmail: widget.userInfo.userEmail.toString(),
          body: emailBody,
          createdAt: DateTime.now());
      EmailDataBase.instance.create(emailToAdd);
      _selectedIndex = 0;
    });
    refreshNotes();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Email Send')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 20,
        title: const Text('YourE-Mail'),
      ),
      body: Center(
        child: <Widget>[
          Container(
            child: Home(allEmails, widget.userInfo, refreshNotes),
          ),
          Container(
            child: ComposeEmail(addEmail),
          ),
          Container(
            child: Profile(widget.userInfo),
          ),
        ][_selectedIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: Icons.mail_outline,
                  text: 'Inbox',
                ),
                GButton(
                  icon: Icons.outgoing_mail,
                  text: 'New E-Mail',
                ),
                GButton(
                  icon: Icons.account_circle_outlined,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
