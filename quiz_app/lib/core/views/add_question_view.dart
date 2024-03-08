import 'package:flutter/material.dart';
import 'package:quiz_app/common/widgets/custom_btn.dart';
import 'package:quiz_app/core/views/home_view.dart';
import 'package:quiz_app/core/widgets/top_widget.dart';
import 'package:quiz_app/res/colors.dart';
import 'package:quiz_app/services/database_service.dart';
import 'package:quiz_app/utils/use_full_functions.dart';

class AddQuestionView extends StatefulWidget {
  static const String routeName = '/add_question_view';
  final String quizId;
  const AddQuestionView({super.key, required this.quizId});

  @override
  State<AddQuestionView> createState() => _AddQuestionViewState();
}

class _AddQuestionViewState extends State<AddQuestionView> {
  final _formKey = GlobalKey<FormState>();
  late String question, option1, option2, option3, option4;
  final _databaseService = DatabaseService();
  uploudQuizData() async {
    if (_formKey.currentState!.validate()) {
      Map<String, String> questionData = {
        "question": question,
        "option1": option1,
        "option2": option2,
        "option3": option3,
        "option4": option4,
        //clear all field of form , using formkey
      };
      await _databaseService
          .addQuestionData(
              questionData: questionData,
              quizId: widget.quizId,
              context: context)
          .then((value) {
        //clear old data of data
        question = "";
        option1 = "";
        option2 = "";
        option3 = "";
        option4 = "";
        _formKey.currentState!.reset();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TopWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: getDeviceHeight(context) * 0.03,
                ),
                TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please enter question";
                    }
                    return null;
                  },
                  onChanged: (val) {
                    question = val;
                  },
                  decoration: const InputDecoration(
                    labelText: "Question",
                    hintText: "Enter your question",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: getDeviceHeight(context) * 0.03,
                ),
                TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please enter option 1";
                    }
                    return null;
                  },
                  onChanged: (val) {
                    option1 = val;
                  },
                  decoration: const InputDecoration(
                    labelText: "Option 1 (Correct Answer)",
                    hintText: "Enter your option 1",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: getDeviceHeight(context) * 0.03,
                ),
                TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please enter option 2";
                    }
                    return null;
                  },
                  onChanged: (val) {
                    option2 = val;
                  },
                  decoration: const InputDecoration(
                    labelText: "Option 2",
                    hintText: "Enter your Option 2",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: getDeviceHeight(context) * 0.03,
                ),
                TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please enter Option 3";
                    }
                    return null;
                  },
                  onChanged: (val) {
                    option3 = val;
                  },
                  decoration: const InputDecoration(
                    labelText: "Option 3",
                    hintText: "Enter your Option 3",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: getDeviceHeight(context) * 0.03,
                ),
                TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please enter Option 4";
                    }
                    return null;
                  },
                  onChanged: (val) {
                    option4 = val;
                  },
                  decoration: const InputDecoration(
                    labelText: "Option 4",
                    hintText: "Enter your Option 4",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: getDeviceHeight(context) * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: getDeviceWidth(context) * 0.45,
                      child: CustomElevatedBtn(
                        text: "Submit",
                        onPressed: () {
                          Navigator.pushNamed(context, HomeView.routeName);
                        },
                        bgColor: AppColors.primaryColor,
                        borderColor: Colors.transparent,
                        textColor: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: getDeviceWidth(context) * 0.45,
                      child: CustomElevatedBtn(
                        text: "Add Question",
                        onPressed: uploudQuizData,
                        bgColor: AppColors.primaryColor,
                        borderColor: Colors.transparent,
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
