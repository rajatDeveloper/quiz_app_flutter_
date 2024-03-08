import 'package:flutter/material.dart';
import 'package:quiz_app/utils/use_full_functions.dart';

// ignore: must_be_immutable
class CustomElevatedBtn extends StatelessWidget {
  CustomElevatedBtn({
    super.key,
    required this.text,
    required this.onPressed,
    required this.bgColor,
    required this.borderColor,
    required this.textColor,
  });

  Color bgColor;
  Color textColor;
  Color borderColor;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 0.0),
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          side: BorderSide(color: borderColor),
          elevation: 3,
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(
            // horizontal: 20.0,
            vertical: 10.0,
          ),
          minimumSize: const Size.fromHeight(30),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: getFontSize(20, getDeviceWidth(context)),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
