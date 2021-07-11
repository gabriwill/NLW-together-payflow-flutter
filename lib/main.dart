import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app_widget.dart';
import 'loading.dart';
import 'somethingwrong.dart';

void main() {
  runApp(AppFirebase());
}

class AppFirebase extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _AppFirebaseState createState() => _AppFirebaseState();
}

class _AppFirebaseState extends State<AppFirebase> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return SomethingWentWrong();
        }

        // Once complete, show your application
        else if (snapshot.connectionState == ConnectionState.done) {
          return AppWidget();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        else
          return Loading();
      },
    );
  }
}
