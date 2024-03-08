import 'package:flutter/material.dart';
import 'package:quiz_app/common/widgets/custom_btn.dart';
import 'package:quiz_app/core/views/home_view.dart';
import 'package:quiz_app/core/views/play_quiz_view.dart';
import 'package:quiz_app/res/colors.dart';

class ResultView extends StatelessWidget {
  static const String routeName = "result-view";
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Column(
            children: [
              Text(
                "$correct/$total",
                style: const TextStyle(
                    fontSize: 20, color: AppColors.primaryColor),
              ),
              const Text(
                "You have successfully completed the quiz",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
            child: CustomElevatedBtn(
                text: "Go Home",
                onPressed: () {
                  Navigator.pushNamed(context, HomeView.routeName);
                },
                bgColor: AppColors.primaryColor,
                borderColor: Colors.transparent,
                textColor: Colors.white),
          ),
        ],
      ),
    );
  }
}
