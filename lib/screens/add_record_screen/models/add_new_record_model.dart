import 'package:get/get.dart';

import '../../../data/models/selection_pop_up_model/selction_pop_up_model.dart';

class Add_New_Record_Model {
  DateTime selectedLabelTxt = DateTime.now();

  Rx<String> labelTxt = Rx('Next Appointment');

  //late List<String> symptoms;

  // Add_New_Record_Model({this.symptoms});

  RxList<SelectionPopupModel> dropdownItemList = [
    SelectionPopupModel(
      id: 1,
      title: "Male",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Female",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Other",
    )
  ].obs;
}
