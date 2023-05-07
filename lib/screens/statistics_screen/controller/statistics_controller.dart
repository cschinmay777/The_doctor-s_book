import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_book/core/constants/firebaseconstants.dart';
import 'package:doctor_book/screens/search_records/models/patient_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatisticsController extends GetxController {
  var statisticsList = <String, Map>{}.obs;

  @override
  void onReady() {
    super.onReady();
    getStatistics();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future getStatistics() async {
    var list = await FirebaseFirestore.instance
        .collection('/doctors')
        .doc(firebaseAuth.currentUser?.uid)
        .get();
    if (list.data() != null) {
      var records = list
          .data()!['patients']
          .map<Patient>((e) => Patient.fromJson(e))
          .toList();
      var statisticsData = <String, Map>{};
      for (var patient in records) {
        for (var entry in patient.records!) {
          for (var symptom in entry.symptoms!) {
            if (statisticsData.containsKey(symptom)) {
              if (statisticsData[symptom]!.containsKey(entry.date.month)) {
                statisticsData[symptom]![entry.date.month] =
                    statisticsData[symptom]![entry.date.month]! + 1;
              } else {
                statisticsData[symptom]![entry.date.month] = 1;
              }
            } else {
              statisticsData[symptom] = {entry.date.month: 1};
            }
          }
        }
      }
      log(statisticsData.toString());
      statisticsList.value = statisticsData;
      return statisticsData;
    }
    log('No data');
  }
}
