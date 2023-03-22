import 'package:get/get.dart';

import '../controllers/appointment_page_controller.dart';

class AppointmentPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppointmentPageController());
  }
}
