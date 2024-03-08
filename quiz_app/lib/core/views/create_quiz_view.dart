import 'package:flutter/material.dart';
import 'package:quiz_app/common/widgets/custom_btn.dart';
import 'package:quiz_app/core/views/add_question_view.dart';
import 'package:quiz_app/core/widgets/top_widget.dart';
import 'package:quiz_app/res/colors.dart';
import 'package:quiz_app/services/database_service.dart';
import 'package:quiz_app/utils/use_full_functions.dart';
import 'package:random_string/random_string.dart';

class CreateQuizView extends StatefulWidget {
  static const String routeName = "/create-quiz";
  const CreateQuizView({super.key});

  @override
  State<CreateQuizView> createState() => _CreateQuizViewState();
}

class _CreateQuizViewState extends State<CreateQuizView> {
  final _formKey = GlobalKey<FormState>();
  late String quizUrl, quizTitle, quizDes, quizId;
  final _dbService = DatabaseService();
  createQuiz() async {
    if (_formKey.currentState!.validate()) {
      quizId = randomAlphaNumeric(16);
      Map<String, String> data = {
        "quizId": quizId,
        "quizUrl": quizUrl,
        "quizTitle": quizTitle,
        "quizDesc": quizDes
      };

      await _dbService.addQuizData(data, quizId, context).then((value) {
        Navigator.pushNamed(context, AddQuestionView.routeName,
            arguments: quizId);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TopWidget(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
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
                      return "Please enter image url";
                    }
                    return null;
                  },
                  onChanged: (val) {
                    quizUrl = val;
                  },
                  decoration: const InputDecoration(
                    labelText: "Quiz Image Url",
                    hintText: "Enter your image url",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: getDeviceHeight(context) * 0.03,
                ),
                TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please enter quiz title";
                    }
                    return null;
                  },
                  onChanged: (val) {
                    quizTitle = val;
                  },
                  decoration: const InputDecoration(
                    labelText: "Quiz Title",
                    hintText: "Enter your quiz title",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: getDeviceHeight(context) * 0.03,
                ),
                TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please enter description";
                    }
                    return null;
                  },
                  onChanged: (val) {
                    quizDes = val;
                  },
                  decoration: const InputDecoration(
                    labelText: "Quiz Description",
                    hintText: "Enter your quiz description",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: getDeviceHeight(context) * 0.03,
                ),
                CustomElevatedBtn(
                  text: "Create Quiz",
                  onPressed: createQuiz,
                  bgColor: AppColors.primaryColor,
                  borderColor: Colors.transparent,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
