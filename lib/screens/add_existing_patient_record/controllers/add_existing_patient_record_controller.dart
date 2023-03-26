import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_book/screens/add_existing_patient_record/model/add_existing_patient_record_model.dart';
import 'package:doctor_book/screens/appointments_records/models/patient_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/firebaseconstants.dart';
import '../../../data/models/selection_pop_up_model/selction_pop_up_model.dart';

class AddExistingRecordPageController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController temperatureController = TextEditingController();
  TextEditingController bpController = TextEditingController();
  TextEditingController prescriptionController = TextEditingController();
  SelectionPopupModel? selectedDropDownValue;
  // late List<String> symptoms;
  Rx<Add_Existing_Record_Model> add_new_record_ModelObj =
      Add_Existing_Record_Model().obs;
  late int index;

  var searchList = <Patient>[].obs;
  List? plst;
  List? rlst;

  Future getAllPatientDetails() async {
    // print(firebaseAuth.currentUser?.uid);
    var list = await firestore
        .collection('/doctors')
        .doc(firebaseAuth.currentUser?.uid)
        .get();
    plst = list.data()!['patients'];
    rlst = plst = list.data()!['patients'][index]['records'];
    print(plst);
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
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    numberController.dispose();
    nameController.clear();
    ageController.clear();
    addressController.clear();
    weightController.clear();
    temperatureController.clear();
    bpController.clear();
    prescriptionController.clear();
  }

  onSelected(dynamic value) {
    selectedDropDownValue = value as SelectionPopupModel;
    add_new_record_ModelObj.value.dropdownItemList.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });
    add_new_record_ModelObj.value.dropdownItemList.refresh();
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

  Future sendPatientData(
      {User? currentUser,
      DateTime? next,
      String? weight,
      String? temp,
      String? bp,
      List? symptoms,
      String? prscription,
      List? records,
      DateTime? date,
      required}) async {
    var rec = {
      'weight': weightController.text,
      'temp': temperatureController.text,
      'bp': bpController.text,
      'symptoms': symptoms,
      'date': DateTime.now(),
      'prescription': prescriptionController.text,
    };

    rlst?.add(rec);
    print(plst);
    plst![index]['records'] = rlst;
    List lst = [
      {
        // 'name': nameController.text,
        // 'phone': numberController.text,
        // 'address': addressController.text,
        // 'gender': selectedDropDownValue?.title,
        // 'age': ageController.text,
        // 'uid': firebaseAuth.currentUser?.uid,
        'records': plst,
        'next': add_new_record_ModelObj.value.labelTxt.value,
      }
    ];

    await firestore
        .collection("doctors")
        .doc(firebaseAuth.currentUser?.uid)
        .update({
      'patients': plst,
    });
  }
}
