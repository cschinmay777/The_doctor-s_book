import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_book/screens/appointments_records/models/doctormodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/firebaseconstants.dart';
import '../models/appintmentpagemodel.dart';

class AppointmentPageController extends GetxController {
  Rx<AppointmentPageModel> appointmentPageModelObj = AppointmentPageModel().obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
