import 'package:flutter/material.dart';
import 'package:quiz_app/core/views/create_quiz_view.dart';
import 'package:quiz_app/core/views/sign_in_view.dart';
import 'package:quiz_app/core/views/splash_view.dart';
import 'package:quiz_app/core/widgets/quiz_type_card_widget.dart';
import 'package:quiz_app/core/widgets/top_widget.dart';
import 'package:quiz_app/res/colors.dart';
import 'package:quiz_app/services/auth_service.dart';
import 'package:quiz_app/services/database_service.dart';

class HomeView extends StatefulWidget {
  static const String routeName = "/home";
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  AuthService _authService = AuthService();

  late Stream quizStream = Stream.empty();
  final _databaseService = DatabaseService();

  @override
  void initState() {
    super.initState();

    _databaseService.getQuizData().then((value) {
      setState(() {
        quizStream = value;
      });
    });
  }

  Widget quizList() {
    return Container(
      child: StreamBuilder(
        stream: quizStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          }
          if (snapshot.hasError || snapshot.data == null) {
            return const Center(
              child: Text("Something went wrong"),
            );
          }
          if (snapshot.hasData && snapshot.data != null) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return QuizTypeCardWidget(
                    quizId: snapshot.data!.docs[index]["quizId"],
                    imgUrl: snapshot.data!.docs[index]["quizUrl"],
                    title: snapshot.data!.docs[index]["quizTitle"],
                    desc: snapshot.data!.docs[index]["quizDesc"]);
              },
            );
          }
          return const Center(
            child: Text("No data found"),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TopWidget(),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Welcome to Quiz Maker Pro"),
              accountEmail: Text("Create Quiz and enjoy"),
              currentAccountPicture: CircleAvatar(
                child: FlutterLogo(),
              ),
            ),
            InkWell(
              onTap: () async {
                await _authService.signOut(context: context).then((value) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    SplashView.routName,
                    (route) => false,
                  );
                });
              },
              child: const ListTile(
                title: Text("Logout"),
                leading: Icon(Icons.logout),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          Navigator.pushNamed(context, CreateQuizView.routeName);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: quizList(),
    );
  }
}
