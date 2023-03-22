import 'package:get/get.dart';
import '../../../core/utils/image_constants.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/app_style.dart';
import '../../../widgets/custom_image_view.dart';
import '../controllers/appointment_page_controller.dart';
import '../models/listrectanglefour2_item_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Listrectanglefour2ItemWidget extends StatelessWidget {
  Listrectanglefour2ItemWidget(this.listrectanglefour2ItemModelObj);

  Listrectanglefour2ItemModel listrectanglefour2ItemModelObj;

  var controller = Get.find<AppointmentPageController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: getMargin(
        top: 12.0,
        bottom: 12.0,
      ),
      padding: getPadding(
        all: 20,
      ),
      decoration: AppDecoration.outlineBlack9000c.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgRectangle4,
            height: getSize(
              100.00,
            ),
            width: getSize(
              100.00,
            ),
            radius: BorderRadius.circular(
              getHorizontalSize(
                16.00,
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              left: 16,
              top: 7,
              bottom: 9,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Prathamesh Mulay",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtUrbanistRomanBold20,
                ),
                Padding(
                  padding: getPadding(
                    top: 12,
                  ),
                  child: Text(
                    "26/01/2023",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtUrbanistRegular14Gray300.copyWith(
                      letterSpacing: 0.20,
                    ),
                  ),
                ),
                // Padding(
                //   padding: getPadding(
                //     top: 12,
                //   ),
                //   child: Row(
                //     children: [
                //       CustomImageView(
                //         svgPath: ImageConstant.imgStar12x12,
                //         height: getSize(
                //           12.00,
                //         ),
                //         width: getSize(
                //           12.00,
                //         ),
                //         margin: getMargin(
                //           top: 2,
                //           bottom: 2,
                //         ),
                //       ),
                //       // Padding(
                //       //   padding: getPadding(
                //       //     left: 4,
                //       //   ),
                //       //   child: Text(
                //       //     "lbl_4_8".tr,
                //       //     overflow: TextOverflow.ellipsis,
                //       //     textAlign: TextAlign.left,
                //       //     style: AppStyle.txtUrbanistSemiBold14.copyWith(
                //       //       letterSpacing: 0.20,
                //       //     ),
                //       //   ),
                //       // ),
                //       // Padding(
                //       //   padding: getPadding(
                //       //     left: 8,
                //       //     bottom: 1,
                //       //   ),
                //       //   child: Text(
                //       //     "lbl_4_378_reviews".tr,
                //       //     overflow: TextOverflow.ellipsis,
                //       //     textAlign: TextAlign.left,
                //       //     style: AppStyle.txtUrbanistRegular12.copyWith(
                //       //       letterSpacing: 0.20,
                //       //     ),
                //       //   ),
                //       // ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          // Padding(
          //   padding: getPadding(
          //     left: 48,
          //     top: 6,
          //     bottom: 6,
          //   ),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.end,
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       Text(
          //         "lbl_35".tr,
          //         overflow: TextOverflow.ellipsis,
          //         textAlign: TextAlign.left,
          //         style: AppStyle.txtUrbanistRomanBold24Cyan60001,
          //       ),
          //       Padding(
          //         padding: getPadding(
          //           top: 5,
          //         ),
          //         child: Text(
          //           "lbl_night".tr,
          //           overflow: TextOverflow.ellipsis,
          //           textAlign: TextAlign.left,
          //           style: AppStyle.txtUrbanistRegular10.copyWith(
          //             letterSpacing: 0.20,
          //           ),
          //         ),
          //       ),
          //       CustomImageView(
          //         svgPath: ImageConstant.imgBookmark24x24,
          //         height: getSize(
          //           24.00,
          //         ),
          //         width: getSize(
          //           24.00,
          //         ),
          //         margin: getMargin(
          //           top: 17,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
