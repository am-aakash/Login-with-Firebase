import 'package:flutter/material.dart';
import 'package:login_with_auth/Screens/signup_page.dart';

import 'login_page.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool isToggle = false;
  void toggleScreen() {
    setState(() {
      isToggle = !isToggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isToggle) {
      return SignupPage(toggleScreen: toggleScreen);
    } else {
      return LoginPage(toggleScreen: toggleScreen);
    }
  }
}
