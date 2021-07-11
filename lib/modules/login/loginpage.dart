//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:payflow/modules/login/logincontroller.dart';
import 'package:payflow/shared/themes/appcolors.dart';
import 'package:payflow/shared/themes/appimages.dart';
import 'package:payflow/shared/themes/apptextstyles.dart';
import 'package:payflow/shared/widgets/sociallogin/social_login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.background,
        body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.36,
                color: AppColors.primary,
              ),
              Positioned(
                  top: 40,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    AppImages.person,
                    height: size.height * 0.4,
                    width: size.height * 0.4 * (208 / 373),
                  )),
              Positioned(
                bottom: size.height * 0.08,
                left: 0,
                right: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: size.height * 0.1,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          AppColors.background,
                          AppColors.background,
                          Color(0x00ffffff)
                        ],
                      )),
                    ),
                    Image.asset(AppImages.logomini),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 60, right: 60),
                      child: Text(
                        'Organize seus boletos em um só lugar',
                        style: TextStyles.titleHome,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 40, right: 40),
                      child: SocialLoginButton(onTap: () {
                        controller.googleSignIn(context);
                      }),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
