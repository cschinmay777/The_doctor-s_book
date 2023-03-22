import 'package:doctor_book/Routes/app_routes.dart';
import 'package:doctor_book/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_button.dart';

class Welcome_Screen extends StatelessWidget {
  const Welcome_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.gray800,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 40,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Lottie.asset(
                  'assets/lottie/hii.json',
                  fit: BoxFit.fill,
                  height: 300,
                ),
              ),
              Padding(
                  padding: getPadding(top: 40, right: 100),
                  child: Text("Hello Doctor !!!",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtUrbanistRomanBold48)),
              Padding(
                  padding: getPadding(top: 10, left: 50),
                  child: Text("Let's open our register.",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtUrbanistRegular18)),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          CustomButton(
            height: 120,
            width: 380,
            text: "Get Started",
            fontStyle: ButtonFontStyle.UrbanistSemiBold56,
            onTap: () {
              Get.toNamed(AppRoutes.loginScreen);
            },
          ),
        ],
      ),
    );
  }
}
