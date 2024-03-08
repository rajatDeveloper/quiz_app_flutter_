import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/common/widgets/loader.dart';
import 'package:quiz_app/utils/use_full_functions.dart';

class DatabaseService {
  //add quiz type service
  Future<void> addQuizData(Map<String, dynamic> quizData, String quizId,
      BuildContext context) async {
    try {
      showLoading(context);
      //will create the quiz model in cloud firestore
      await FirebaseFirestore.instance
          .collection('Quiz')
          .doc(quizId)
          .set(quizData)
          .then((value) => print("Quiz Added "));

      showSnackBar(context, 'Quiz Type Added Successfully');
      hideLoading(context);
    } catch (e) {
      showSnackBar(context, 'Error : $e');
      hideLoading(context);
    }
  }

  //add question to quizType service
  Future<void> addQuestionData(
      {required Map<String, dynamic> questionData,
      required String quizId,
      required BuildContext context}) async {
    try {
      showLoading(context);
      //logic to add question data to Quiz Bank
      await FirebaseFirestore.instance
          .collection('Quiz')
          .doc(quizId)
          .collection("QNA")
          .add(questionData)
          .then((value) => print("question Added "));

      showSnackBar(context, 'Question Added Successfully');
      hideLoading(context);
    } catch (e) {
      hideLoading(context);
      showSnackBar(context, 'Error : $e');
    }
  }

  //get quize data
  Future<Stream> getQuizData() async {
    return FirebaseFirestore.instance.collection("Quiz").snapshots();
  }

  //get question data of respected quiz type
  getQuestionForQuizType({required String quizId}) async {
    return FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizId)
        .collection("QNA")
        .get();
  }
}
