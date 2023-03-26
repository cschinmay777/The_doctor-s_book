// import 'package:doctor_book/screens/add_record_screen/controller/add_record_screen_controller.dart';
import 'package:get/get.dart';

import '../controllers/add_existing_patient_record_controller.dart';

class AddExistingRecordPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(() => AddExistingRecordPageController());
  }
}
