import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/model/question_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

//using this for responsive screen

double getDeviceHeight(BuildContext context) =>
    MediaQuery.of(context).size.height;

double getDeviceWidth(BuildContext context) =>
    MediaQuery.of(context).size.width;

//using custom snack bar
void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

//using this function for responsive text
double getFontSize(double size, double screenWidth) {
  return size * screenWidth / 414;
}

//shared preferences functions
setDataToLocal({required String key, required String value}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}

Future<String> getSavedDataByKey({required String key}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String? data = prefs.getString(key);
  return data ?? "";
}

Future<void> removeDataByKey({required String key}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove(key);
}

QuestionModel getQuestionModelFromSnapShot(DocumentSnapshot questionSnapShot) {
  QuestionModel questionModel = QuestionModel();
  questionModel.question = questionSnapShot["question"];
  List<String> options = [
    questionSnapShot["option1"],
    questionSnapShot["option2"],
    questionSnapShot["option3"],
    questionSnapShot["option4"]
  ];
  questionModel.correctOption = questionSnapShot["option1"];
  options.shuffle();
  questionModel.option1 = options[0];
  questionModel.option2 = options[1];
  questionModel.option3 = options[2];
  questionModel.option4 = options[3];
  questionModel.answered = false;

  return questionModel;
}
