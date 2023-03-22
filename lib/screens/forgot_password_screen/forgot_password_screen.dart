import 'package:doctor_book/screens/forgot_password_screen/widgets/listuser_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/color_constants.dart';
import '../../core/utils/image_constants.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_style.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';
import 'controllers/forgot_password_controller.dart';
import 'models/listuser_item_model.dart';

class ForgotPasswordScreen extends GetWidget<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray900,
            appBar: CustomAppBar(
                height: getVerticalSize(56.00),
                leadingWidth: 52,
                leading: AppbarImage(
                    height: getSize(28.00),
                    width: getSize(28.00),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 24, top: 11, bottom: 15),
                    onTap: onTapArrowleft1),
                title: AppbarTitle(
                    text: "Forgot Password", margin: getMargin(left: 16))),
            body: SingleChildScrollView(
              child: Container(
                  width: size.width,
                  padding: getPadding(left: 24, top: 48, right: 24, bottom: 48),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgImage,
                            height: getSize(240.00),
                            width: getSize(240.00),
                            margin: getMargin(top: 9)),
                        Container(
                            width: getHorizontalSize(371.00),
                            margin: getMargin(top: 44),
                            child: Text(
                                "Select which contact details should we use to reset your password",
                                maxLines: null,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtUrbanistRegular16WhiteA700
                                    .copyWith(letterSpacing: 0.20))),
                        Padding(
                            padding: getPadding(top: 25),
                            child: Obx(() => ListView.builder(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.forgotPasswordModelObj
                                    .value.listuserItemList.length,
                                itemBuilder: (context, index) {
                                  ListuserItemModel model = controller
                                      .forgotPasswordModelObj
                                      .value
                                      .listuserItemList[index];
                                  return ListuserItemWidget(model);
                                }))),
                        CustomButton(
                            height: 55,
                            width: 380,
                            text: "Continue",
                            margin: getMargin(top: 39),
                            variant: ButtonVariant.OutlineGreenA7003f)
                      ])),
            )));
  }

  onTapArrowleft1() {
    Get.back();
  }
}
