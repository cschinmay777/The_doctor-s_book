import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:doctor_book/Routes/app_routes.dart';

class Splash_Screen_Controller extends GetxController {
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.offNamed(AppRoutes.decision);
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
