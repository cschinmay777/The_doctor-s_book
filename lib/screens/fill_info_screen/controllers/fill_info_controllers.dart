import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/selection_pop_up_model/selction_pop_up_model.dart';
import '../models/fill_info_model.dart';

class Fill_Info_Controller extends GetxController {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController genderController = TextEditingController();

  TextEditingController clinicController = TextEditingController();

  TextEditingController resedentialController = TextEditingController();

  SelectionPopupModel? selectedDropDownValue;

  Rx<Fill_Info_Model> fill_Info_ModelObj = Fill_Info_Model().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    fullNameController.dispose();
    phoneController.dispose();
    genderController.dispose();
    clinicController.dispose();
    resedentialController.dispose();
  }

  onSelected(dynamic value) {
    selectedDropDownValue = value as SelectionPopupModel;
    fill_Info_ModelObj.value.dropdownItemList.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });
    fill_Info_ModelObj.value.dropdownItemList.refresh();
  }
}
