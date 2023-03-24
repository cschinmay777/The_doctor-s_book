import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/color_constants.dart';
import '../../login_screen/login_screen.dart';
import '../models/forgot_password_model.dart';

class ForgotPasswordController extends GetxController {
  Rx<ForgotPasswordModel> forgotPasswordModelObj = ForgotPasswordModel().obs;
  TextEditingController emailController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void PasswordResetEmail(String email) async{
    await _auth.sendPasswordResetEmail(email: email).then((value) {
      Get.offAll(Login_Screen());
      Get.snackbar("Password reset email link is been sent.","Success",colorText: Colors.white ,snackPosition: SnackPosition.BOTTOM ,backgroundColor: ColorConstant.cyan60001);
    }).catchError((onError)=>Get.snackbar("Error in email reset.",onError.message,colorText: Colors.white ,snackPosition: SnackPosition.BOTTOM ,backgroundColor: ColorConstant.cyan60001));
  }
}
