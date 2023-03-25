import 'package:doctor_book/Routes/app_routes.dart';
import 'package:doctor_book/screens/fill_info_screen/controllers/fill_info_controllers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/firebaseconstants.dart';

class SignupController extends GetxController {
  var ctr = Get.put(Fill_Info_Controller());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool checkbox = false.obs;
  Rx<bool> isShowPassword = false.obs;

  @override
  void onReady() {
    super.onReady();
  }

  var pat = [
    {
      "age": "28",
      "name": "Shubham",
      "next": DateTime.april,
      "records": [
        {
          "date": DateTime.march,
          "prescription": ["crocin", "cough syrup"],
          "symptoms": ["cough", "headache"]
        },
        {
          "date": DateTime.march,
          "prescription": ["calpol", "zeal"],
          "symptoms": ["fever", "dry cough"]
        },
      ]
    }
  ];

  signUp() async {
    await firebaseAuth.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);

    // await saveUser();
    Get.offNamed(AppRoutes.fillinfoScreen);
  }

  Future saveUser(
      {User? currentUser,
      String? name,
      String? dob,
      String? phone,
      String? address,
      String? gender,
      String? email,
      List? patients,
      required}) async {
    print("hey iam in save user");

    firestore.collection("doctors").doc(firebaseAuth.currentUser?.uid).set({
      'name': ctr.fullNameController,
      'phone': ctr.phoneController,
      'address': ctr.clinicController,
      'gender': ctr.genderController,
      'category': ctr.selectedDropDownValue,
      'email': emailController.text,
      'patients': [],
      'uid': firebaseAuth.currentUser?.uid,
    });
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
