import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/firebaseconstants.dart';
import '../../../data/models/selection_pop_up_model/selction_pop_up_model.dart';
import '../models/add_new_record_model.dart';

class AddRecordPageController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController temperatureController = TextEditingController();
  TextEditingController bpController = TextEditingController();
  TextEditingController prescriptionController = TextEditingController();
  SelectionPopupModel? selectedDropDownValue;
  late List<String> symptoms;
  Rx<Add_New_Record_Model> add_new_record_ModelObj = Add_New_Record_Model().obs;
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
      String? name,
      DateTime? next,
      String? age,
      String? phone,
      String? address,
      String? gender,
      String? weight,
      String? temp,
      String? bp,
      List? symptoms,
      String? prscription,
      List? records,
      DateTime? date,
      required}) async {
    List rec = [
      {
        'weight': weightController.text,
        'temp': temperatureController.text,
        'bp': bpController.text,
        'symptoms': symptoms,
        'date': DateTime.now(),
        'prescription': prescriptionController.text,
      }
    ];
    List lst = [
      {
        'name': nameController.text,
        'phone': numberController.text,
        'address': addressController.text,
        'gender': selectedDropDownValue?.title,
        'age': ageController.text,
        'uid': firebaseAuth.currentUser?.uid,
        'records': rec,
        'next': add_new_record_ModelObj.value.labelTxt.value,
      }
    ];
    await firestore
        .collection("doctors")
        .doc(firebaseAuth.currentUser?.uid)
        .update({
      'patients': lst,
    });
  }
}
