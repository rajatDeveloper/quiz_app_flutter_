import 'package:flutter/material.dart';
import 'package:quiz_app/common/widgets/custom_btn.dart';
import 'package:quiz_app/core/views/home_view.dart';
import 'package:quiz_app/core/views/sign_up_view.dart';
import 'package:quiz_app/core/widgets/top_widget.dart';
import 'package:quiz_app/res/colors.dart';
import 'package:quiz_app/services/auth_service.dart';
import 'package:quiz_app/utils/use_full_functions.dart';
// import 'package:quiz_app/utils/use_full_functions.dart';

class SignInView extends StatefulWidget {
  static const String routeName = "/sign-in";
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();
  late String email, password;

  AuthService authService = AuthService();

  signIn() async {
    if (_formKey.currentState!.validate()) {
      await authService
          .signInEmailAndPass(
              email: email, password: password, context: context)
          .then((value) => value != null
              ? Navigator.pushNamedAndRemoveUntil(
                  context,
                  HomeView.routeName,
                  (route) => false,
                )
              : null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const TopWidget(),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: Column(
                  children: [
                    Text(
                      "Sign In",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: getFontSize(30, getDeviceWidth(context)),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  getFontSize(16, getDeviceWidth(context))),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, SignUpView.routeName);
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize:
                                      getFontSize(18, getDeviceWidth(context))),
                            ))
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: getDeviceHeight(context) * 0.03,
              ),
              //email field
              TextFormField(
                validator: (val) {
                  if ((!val!.contains("@") || !val.contains("."))) {
                    return "Please enter valid email";
                  }
                  return null;
                },
                onChanged: (val) {
                  email = val;
                },
                decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your email",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: getDeviceHeight(context) * 0.03,
              ),
              //Password field
              TextFormField(
                obscureText: true,
                validator: (val) {
                  if (val!.length < 6) {
                    return "Please enter password with 6+ characters";
                  }
                  return null;
                },
                onChanged: (val) {
                  password = val;
                },
                decoration: const InputDecoration(
                  labelText: "Password",
                  hintText: "Enter your password",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: getDeviceHeight(context) * 0.03,
              ),
              CustomElevatedBtn(
                  text: "Sign-In",
                  onPressed: () {
                    signIn();
                  },
                  bgColor: AppColors.primaryColor,
                  borderColor: Colors.transparent,
                  textColor: Colors.white),
              SizedBox(
                height: getDeviceHeight(context) * 0.04,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
