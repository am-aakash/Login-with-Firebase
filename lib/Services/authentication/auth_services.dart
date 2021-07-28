import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';

class AuthServices with ChangeNotifier {
  bool _isLoading = false;
  late String _errorMessege;
  bool get isLoading => _isLoading;
  String get errorMessege => _errorMessege;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future login(String email, String password) async {
    try {
      UserCredential authResult = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = authResult.user;
      setLoading(false);
      return user;
    } on SocketException {
      setLoading(false);
      setMessege("No internet, Please connect to internet");
    } catch (e) {
      setLoading(false);
      //setMessege(e.messege);
    }
    notifyListeners();
  }

  void setLoading(val) {
    _isLoading = val;
    notifyListeners();
  }

  void setMessege(messege) {
    _errorMessege = messege;
    notifyListeners();
  }
}
