import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow/shared/auth/authcontroller.dart';
import 'package:payflow/shared/models/usermodel.dart';

class LoginController {
  final authController = AuthController();
  Future<void> googleSignIn(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      final response = await _googleSignIn.signIn();
      final user =
          UserModel(name: response!.displayName!, photo: response.photoUrl);
      authController.setUserAuthState(context, user);
      print(response);
    } catch (error) {
      authController.setUserAuthState(context, null);
      print(error);
    }
  }
}
