import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quiz_app/core/views/home_view.dart';
import 'package:quiz_app/core/views/sign_in_view.dart';
import 'package:quiz_app/res/colors.dart';
import 'package:quiz_app/utils/const.dart';
import 'package:quiz_app/utils/use_full_functions.dart';

class SplashView extends StatefulWidget {
  static const String routName = "splash-screen";
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  loadState() async {
    await Future.delayed(const Duration(seconds: 2));
    //will check the userKey val in local storage
    String res = await getSavedDataByKey(key: userKey);
    log("User uid : $res");
    if (res != "") {
      //go to home screen
      Navigator.pushNamedAndRemoveUntil(
        context,
        HomeView.routeName,
        (route) => false,
      );
    } else {
      //go to sign in screen
      Navigator.pushNamedAndRemoveUntil(
        context,
        SignInView.routeName,
        (route) => false,
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: RichText(
        text: TextSpan(
          text: 'Quiz',
          style: TextStyle(
              color: Colors.black,
              fontSize: getFontSize(34, getDeviceWidth(context))),
          children: <TextSpan>[
            TextSpan(
                text: 'MakerPro',
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: getFontSize(34, getDeviceWidth(context)),
                    fontWeight: FontWeight.bold)),
          ],
        ),
      )),
    );
  }
}
