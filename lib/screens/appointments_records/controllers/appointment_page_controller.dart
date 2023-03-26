import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_book/screens/appointments_records/models/doctormodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/firebaseconstants.dart';
import '../models/appintmentpagemodel.dart';
import '../models/patient_model.dart';

class AppointmentPageController extends GetxController {
  // var searchBarController = TextEditingController().obs;
  Rx<AppointmentPageModel> appointmentPageModelObj = AppointmentPageModel().obs;

  var searchList = <Patient>[].obs;

  @override
  void onReady() {
    super.onReady();
    getAllPatientDetails();
    print(searchList);
  }

  Future getAllPatientDetails() async {
    // print(firebaseAuth.currentUser?.uid);
    var list = await firestore
        .collection('/doctors')
        .doc(firebaseAuth.currentUser?.uid)
        .get();
    if (list.data() != null) {
      var patientList = (list.data()!['patients'] as List<dynamic>)
          .map((e) => Patient.fromJson(e))
          .toList();
      searchList.value = patientList;

      // print("hell ${(patientList[0].next).toString()}");
      return patientList;
    }
    log('No data');
  }

  @override
  void onClose() {
    super.onClose();
  }
}
