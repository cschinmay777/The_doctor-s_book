import 'package:doctor_book/screens/splash_screen/controllers/splash_controller/splash_controller.dart';
import 'package:get/get.dart';

class Splash_Bindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => Splash_Screen_Controller());
  }
}
