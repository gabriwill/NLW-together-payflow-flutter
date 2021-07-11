import 'package:flutter/material.dart';

class SomethingWentWrong extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text(
          "Não foi possivel inicializar o FireBase!",
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}
