import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payflow/modules/barcodescanner/barcodescannerpage.dart';
import 'package:payflow/modules/home/homepage.dart';
import 'package:payflow/modules/splash/splashpage.dart';

import 'main.dart';
import 'modules/insertboleto/insertboletopage.dart';
import 'modules/login/loginpage.dart';
import 'shared/models/usermodel.dart';
import 'shared/themes/appcolors.dart';

class AppWidget extends StatelessWidget {
  AppWidget() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PayFlow',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: AppColors.primary,
      ),
      navigatorObservers: [routeObserver],
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashPage(),
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage(
            user: ModalRoute.of(context)!.settings.arguments as UserModel),
        "/barcodescanner": (context) => BarCodeScanner(),
        "/insertboleto": (context) => InsertBoletoPage(
            barcode: ModalRoute.of(context) != null
                ? ModalRoute.of(context)!.settings.arguments.toString()
                : null),
      },
    );
  }
}
