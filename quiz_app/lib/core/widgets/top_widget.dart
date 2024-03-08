import 'package:flutter/material.dart';
import 'package:quiz_app/res/colors.dart';
import 'package:quiz_app/utils/use_full_functions.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Quiz',
        style: TextStyle(
            color: Colors.black,
            fontSize: getFontSize(30, getDeviceWidth(context))),
        children: <TextSpan>[
          TextSpan(
              text: 'MakerPro',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: getFontSize(30, getDeviceWidth(context)),
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
