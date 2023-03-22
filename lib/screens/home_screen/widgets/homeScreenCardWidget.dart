import 'package:doctor_book/Routes/app_routes.dart';
import 'package:doctor_book/screens/home_screen/controllers/home_screen_controller.dart';
import 'package:doctor_book/screens/home_screen/models/homeScreenItemModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../core/utils/image_constants.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/app_style.dart';
import '../../../widgets/custom_image_view.dart';

// ignore: must_be_immutable
class HomeScreenCardWidget extends StatelessWidget {
  HomeScreenCardWidget(this.homeScreenCardModelObj);

  HomeScreenItemModel homeScreenCardModelObj;

  var controller = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        left: 30,
        top: 45,
        right: 18,
        bottom: 20,
      ),
      decoration: AppDecoration.outlineBlack9000c.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: homeScreenCardModelObj
                .imgaddr, //"assets/images/appointment.jpg",
            height: getVerticalSize(
              110.00,
            ),
            width: getHorizontalSize(
              120.00,
            ),
            radius: BorderRadius.circular(
              getHorizontalSize(
                16.00,
              ),
            ),
            margin: getMargin(
              left: 1,
            ),
          ),
          Container(
            width: getHorizontalSize(
              115.00,
            ),
            margin: getMargin(
              left: 8,
              top: 19,
            ),
            child: Text(
              homeScreenCardModelObj.title,
              maxLines: null,
              textAlign: TextAlign.center,
              style: AppStyle.txtUrbanistRomanBold18,
            ),
          ),
        ],
      ),
    );
  }
}
