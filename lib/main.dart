import 'package:first_flutter_app/home_screen.dart';
import 'package:first_flutter_app/landing_screen.dart';
import 'package:first_flutter_app/login_screen.dart';
import 'package:first_flutter_app/signup_screen.dart';
import 'package:first_flutter_app/structure/user_info.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  UserInfo userInfo = UserInfo("", "", "", "");
  @override
  void setUserDetailsIfCorrect(
      String user_name, String email, String phone_number, String token) {
    setState(() {
      userInfo = UserInfo(user_name, email, phone_number, token);
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return Directionality(textDirection: TextDirection.ltr, child: child!);
      },
      title: 'GNav',
      theme: ThemeData(
        primaryColor: Colors.grey[800],
      ),
      home: LandingPage(),
      routes: {
        '/home_screen': (_) => HomeScreen(userInfo),
        '/login_screen': (_) => LoginScreen(setUserDetailsIfCorrect),
        '/signup_screen': (_) => SignUpScreen(setUserDetailsIfCorrect),
      },
    );
  }
}
