import 'package:flutter/material.dart';
import 'package:payflow/shared/models/usermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  UserModel? _user;

  UserModel get user => _user!;

  void setUserAuthState(BuildContext context, UserModel? user) {
    if (user != null) {
      _user = user;
      saveUser(user);
      Navigator.pushReplacementNamed(context, "/home", arguments: user);
    } else {
      //_user = null;

      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  Future<void> saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("user", user.toJson());
  }

  Future<void> currentUser(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 2));
    if (prefs.containsKey("user")) {
      final user = prefs.get("user") as String;
      setUserAuthState(context, UserModel.fromJson(user));
    } else {
      setUserAuthState(context, null);
    }
  }
}
