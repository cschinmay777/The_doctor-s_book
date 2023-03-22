import 'package:doctor_book/screens/splash_screen/controllers/splash_controller/splash_controller.dart';
import 'package:doctor_book/core/constants/color_constants.dart';
import 'package:doctor_book/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:doctor_book/theme/app_style.dart';

class Splash_Screen extends GetWidget<Splash_Screen_Controller> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray900,
            body: Container(
                width: size.width,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text("hi"),
                      Lottie.asset('assets/lottie/splash.json',
                          height: 300, fit: BoxFit.cover),
                      Padding(
                          padding: getPadding(top: 40, bottom: 5),
                          child: Text("Doctors's Book",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtUrbanistRomanBold48))
                    ]))));
  }
}
