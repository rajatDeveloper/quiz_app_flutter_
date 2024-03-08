import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/common/widgets/custom_btn.dart';
import 'package:quiz_app/core/views/result_view.dart';
import 'package:quiz_app/core/widgets/quiz_title_widget.dart';
import 'package:quiz_app/core/widgets/top_widget.dart';
import 'package:quiz_app/res/colors.dart';

import 'package:quiz_app/services/database_service.dart';
import 'package:quiz_app/utils/use_full_functions.dart';

int total = 0;
int correct = 0;
int incorrect = 0;
int notAttempted = 0;

class PlayQuizView extends StatefulWidget {
  static const String routeName = "play-quiz-screen";
  final String quizId;
  const PlayQuizView({super.key, required this.quizId});

  @override
  State<PlayQuizView> createState() => _PlayQuizViewState();
}

class _PlayQuizViewState extends State<PlayQuizView> {
  final _databaseService = DatabaseService();
  QuerySnapshot? questionSnapShot;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _databaseService
        .getQuestionForQuizType(quizId: widget.quizId)
        .then((value) {
      questionSnapShot = value;
      notAttempted = questionSnapShot!.docs.length;
      correct = 0;
      incorrect = 0;
      total = questionSnapShot!.docs.length;
      print("working - size ${questionSnapShot!.docs.length}");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const TopWidget(),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              questionSnapShot == null || questionSnapShot!.docs.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: questionSnapShot!.docs.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return QuizTileWidget(
                          index: index,
                          questionModel: getQuestionModelFromSnapShot(
                              questionSnapShot!.docs[index]),
                        );
                      },
                    ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                child: CustomElevatedBtn(
                    text: "See Result",
                    onPressed: () {
                      Navigator.pushNamed(context, ResultView.routeName);
                    },
                    bgColor: AppColors.primaryColor,
                    borderColor: Colors.transparent,
                    textColor: Colors.white),
              ),
            ],
          ),
        ));
  }
}
