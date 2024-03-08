import 'package:flutter/widgets.dart';
import 'package:quiz_app/core/views/add_question_view.dart';
import 'package:quiz_app/core/views/create_quiz_view.dart';
import 'package:quiz_app/core/views/home_view.dart';
import 'package:quiz_app/core/views/play_quiz_view.dart';
import 'package:quiz_app/core/views/result_view.dart';
import 'package:quiz_app/core/views/sign_in_view.dart';
import 'package:quiz_app/core/views/sign_up_view.dart';
import 'package:quiz_app/core/views/splash_view.dart';

Map<String, Widget Function(BuildContext)> getAppRoutes() {
  Map<String, Widget Function(BuildContext)> appRoutes = {
    //  AgentListScreen.routeName: (context) {
    //       var args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    //       var listData = args['listData'] as List<AgentModel>;
    //       var caseModel = args['caseModel'] as CaseModel;

    //       return AgentListScreen(
    //         agents: listData,
    //         caseModel: caseModel,
    //       );
    //     },

    AddQuestionView.routeName: (context) {
      var args = ModalRoute.of(context)!.settings.arguments as String;

      return AddQuestionView(
        quizId: args,
      );
    },

    CreateQuizView.routeName: (context) => const CreateQuizView(),
    SignInView.routeName: (context) => const SignInView(),
    SignUpView.routeName: (context) => const SignUpView(),
    HomeView.routeName: (context) => const HomeView(),
    SplashView.routName: (context) => const SplashView(),
    PlayQuizView.routeName: (context) {
      var args = ModalRoute.of(context)!.settings.arguments as String;

      return PlayQuizView(
        quizId: args,
      );
    },
    ResultView.routeName: (context) => const ResultView()
  };
  return appRoutes;
}
