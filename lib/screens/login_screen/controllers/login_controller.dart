//import 'dart:html';
//import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../Routes/app_routes.dart';
import '../login_screen.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();
  User? loggedinuser;
  RxBool checkbox = false.obs;

  Rx<bool> isShowPassword = false.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }
  void login({required String email, required String password}) async {
    final user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    loggedinuser = _auth.currentUser;
    try {
      if (user != null) {
        Get.offNamed(AppRoutes.homescreen);
        Get.snackbar("Success Message", "Logged in successfully.");
      } else {
        Get.snackbar("Error Message", "Enter credentials properly.");
      }
    } catch (e) {
      Get.snackbar(
        'Error Logging in account',
        e.toString(),
      );
    }
  }
  loginWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication? googleSignInAuthentication =
      await googleSignInAccount?.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication?.accessToken,
        idToken: googleSignInAuthentication?.idToken,
      );
      final authResult = await _auth.signInWithCredential(credential);

      final User? user = authResult.user;
      // assert(!user?.isAnonymous);
      assert(await user?.getIdToken() != null);
      final User? currentUser = _auth.currentUser;
      assert(user?.uid == currentUser?.uid);
      Get.toNamed(AppRoutes.homescreen); // navigate to your wanted page
      return;
    } catch (e) {
      Get.snackbar(
        'Error Logging in account',
        e.toString(),
      );
    }
  }
  // onTapImgGoogle() async {
  //   // await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
  //   //   if (googleUser != null) {
  //   //     //TODO Actions to be performed after signin
  //   //   } else {
  //   //     Get.snackbar('Error', 'user data is empty');
  //   //   }
  //   // }).catchError((onError) {
  //   //   Get.snackbar('Error', onError.toString());
  //   // });
  // }
  void signout() {
    _auth.signOut().then((value) => Get.offNamed(AppRoutes.loginScreen));
  }
}
