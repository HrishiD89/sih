import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sih_project/screens/homepage.dart';
import 'package:sih_project/screens/loginscreen.dart';

import '../screens/signupscreen.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool ShowLoginPage = true;

  void toggleScreens() {
    setState(() {
      ShowLoginPage = !ShowLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (ShowLoginPage) {
      return LoginPage(showSignupscreen: toggleScreens);
    } else {
      return Signupscreen(showLoginPage: toggleScreens);
    }
  }
}
