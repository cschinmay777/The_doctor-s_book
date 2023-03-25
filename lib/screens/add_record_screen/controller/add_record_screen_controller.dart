import 'package:cloud_firestore/cloud_firestore.dart';
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
}
