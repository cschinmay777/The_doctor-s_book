import 'package:doctor_book/screens/fill_info_screen/controllers/fill_info_controllers.dart';
import 'package:get/get.dart';

class Fill_Info_Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Fill_Info_Controller());
  }
}
