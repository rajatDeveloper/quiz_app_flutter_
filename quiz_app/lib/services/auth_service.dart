import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/common/widgets/loader.dart';
import 'package:quiz_app/core/views/sign_in_view.dart';
// import 'package:quiz_app/core/views/home_view.dart';
import 'package:quiz_app/model/user_model.dart';
import 'package:quiz_app/utils/const.dart';
import 'package:quiz_app/utils/use_full_functions.dart';
import 'package:quiz_app/utils/use_full_functions.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

// FirebaseAuth to our user model
  UserModel _userFromFireBase(User user) {
    return UserModel(uid: user.uid);
  }

  // Sign up with email and password
  Future signInEmailAndPass(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      showLoading(context);
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = userCredential.user!;

      // ignore: use_build_context_synchronously
      hideLoading(context);
      var userModel = _userFromFireBase(user);
      _setUserDataToLoacl(userModel);
      //returning our user model object using firebase model
      return userModel;
    } catch (e) {
      // ignore: use_build_context_synchronously
      hideLoading(context);

      // ignore: use_build_context_synchronously
      showSnackBar(context, 'Error : $e');
    }
  }

  //sign-up with email and password

  Future signUpEmailAndPass(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      showLoading(context);
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user!;

      // ignore: use_build_context_synchronously
      hideLoading(context);
      //returning our user model object using firebase model
      var userModel = _userFromFireBase(user);
      _setUserDataToLoacl(userModel);
      return userModel;
    } catch (e) {
      // ignore: use_build_context_synchronously
      hideLoading(context);
      // ignore: use_build_context_synchronously
      showSnackBar(context, 'Error : $e');
    }
  }

  //signout function
  Future signOut({required BuildContext context}) async {
    try {
      showLoading(context);
      _deleteDataFromLocal();
      await _auth.signOut();

      // ignore: use_build_context_synchronously
      showSnackBar(context, "Sign out successfully");
      // ignore: use_build_context_synchronously
      hideLoading(context);
    } catch (e) {
      // ignore: use_build_context_synchronously
      hideLoading(context);
      // ignore: use_build_context_synchronously
      showSnackBar(context, 'Error : $e');
    }
  }

  void _setUserDataToLoacl(UserModel user) async {
    await setDataToLocal(key: userKey, value: user.uid);
  }

  void _deleteDataFromLocal() async {
    await removeDataByKey(key: userKey);
  }
}
