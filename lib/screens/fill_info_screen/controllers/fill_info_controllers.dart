import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Routes/app_routes.dart';
import '../../../core/constants/firebaseconstants.dart';
import '../../../data/models/selection_pop_up_model/selction_pop_up_model.dart';
import '../models/fill_info_model.dart';

class Fill_Info_Controller extends GetxController {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController genderController = TextEditingController();

  TextEditingController clinicController = TextEditingController();

  TextEditingController resedentialController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  SelectionPopupModel? selectedDropDownValue;

  Rx<Fill_Info_Model> fill_Info_ModelObj = Fill_Info_Model().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    // fullNameController.dispose();
    // phoneController.dispose();
    // genderController.dispose();
    // clinicController.dispose();
    // resedentialController.dispose();
    // emailController.dispose();
    // passwordController.dispose();
  }

  onSelected(dynamic value) {
    selectedDropDownValue = value as SelectionPopupModel;
    fill_Info_ModelObj.value.dropdownItemList.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });
    genderController.text = value as String;
    fill_Info_ModelObj.value.dropdownItemList.refresh();
  }

  // signUp() async {
  //   await firebaseAuth.createUserWithEmailAndPassword(
  //       email: emailController.text, password: passwordController.text);
  //
  //   await saveUser();
  //   Get.offNamed(AppRoutes.homescreen);
  // }

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
      'name': fullNameController.text,
      'phone': phoneController.text,
      'address': clinicController.text,
      'gender': selectedDropDownValue?.title,
      'email': firebaseAuth.currentUser?.email,
      'patients': [],
      'uid': firebaseAuth.currentUser?.uid,
    });
  }
}
