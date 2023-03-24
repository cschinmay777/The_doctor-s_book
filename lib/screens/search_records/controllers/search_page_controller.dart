import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_book/screens/search_records/models/patient_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPageController extends GetxController {
  var searchBarController = TextEditingController().obs;

  var searchList = <Patient>[].obs;

  @override
  void onReady() {
    super.onReady();
    getAllPatientDetails();
  }

  @override
  void onClose() {
    super.onClose();
    searchBarController.value.dispose();
  }

  Future getAllPatientDetails() async {
    var list =
        await FirebaseFirestore.instance.collection('/doctors').doc('atkySVCs4IaY0eZRJS63').get();
    if (list.data() != null) {
      var patientList =
          (list.data()!['patients'] as List<dynamic>).map((e) => Patient.fromJson(e)).toList();
      searchList.value = patientList;
      return patientList;
    }
    log('No data');
  }
}
