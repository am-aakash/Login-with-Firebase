import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_with_auth/Screens/auth.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    if (user != null) {
      return Scaffold(
        body: Center(
          child: Text("HomePage"),
        ),
      );
    } else {
      return Authentication();
    }
  }
}
