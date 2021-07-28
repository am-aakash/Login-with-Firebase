import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_with_auth/Screens/login_page.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  
  bool isToggle = false;
  void toggleScreen() {
    
      isToggle = false;

  }
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    if(user != null){
      return HomePage();
    }
    else{
      return LoginPage(toggleScreen: );
    }
  }
}