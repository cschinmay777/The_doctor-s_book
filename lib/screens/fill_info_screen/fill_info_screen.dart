import 'package:doctor_book/Routes/app_routes.dart';
import 'package:doctor_book/core/utils/date_time_utils.dart';
import 'package:doctor_book/screens/fill_info_screen/controllers/fill_info_controllers.dart';
import 'package:doctor_book/screens/signup_screen/controllers/signup_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../core/constants/color_constants.dart';
import '../../core/utils/image_constants.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_text_form_field.dart';

class Fill_Info_Screen extends StatelessWidget {
  var controller = Get.put(Fill_Info_Controller());
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
                    margin: getMargin(left: 24, top: 11, bottom: 13),
                    onTap: onTapArrowleft),
                centerTitle: true,
                title: AppbarTitle(text: "Fill Your Profile")),
            body: SingleChildScrollView(
              child: Container(
                  width: size.width,
                  padding: getPadding(left: 24, top: 40, right: 24, bottom: 40),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            height: getSize(140.00),
                            width: getSize(140.00),
                            child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgEllipse,
                                      height: getSize(140.00),
                                      width: getSize(140.00),
                                      radius: BorderRadius.circular(
                                          getHorizontalSize(70.00)),
                                      alignment: Alignment.center),
                                  CustomImageView(
                                      svgPath: ImageConstant.imgEdit,
                                      height: getSize(35.00),
                                      width: getSize(35.00),
                                      alignment: Alignment.bottomRight)
                                ])),
                        CustomTextFormField(
                            width: 380,
                            focusNode: FocusNode(),
                            controller: controller.fullNameController,
                            hintText: "Full Name",
                            margin: getMargin(top: 24),
                            fontStyle:
                                TextFormFieldFontStyle.UrbanistRegular14),

                        // CustomTextFormField(
                        //     width: 380,
                        //     focusNode: FocusNode(),
                        //     controller: controller.nicknameController,
                        //     hintText: "lbl_nickname".tr,
                        //     margin: getMargin(top: 24),
                        //     fontStyle: TextFormFieldFontStyle.UrbanistRegular14),
                        GestureDetector(
                            onTap: () {
                              onTapDateofbirth();
                            },
                            child: Container(
                                margin: getMargin(top: 24),
                                padding: getPadding(
                                    left: 20, top: 18, right: 20, bottom: 18),
                                decoration: AppDecoration.fillBluegray90001
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder12),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding:
                                              getPadding(top: 1, bottom: 1),
                                          child: Obx(() => Text(
                                              controller.fill_Info_ModelObj
                                                  .value.labelTxt.value,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtUrbanistRegular14Gray500
                                                  .copyWith(
                                                      letterSpacing: 0.20)))),
                                      CustomImageView(
                                          svgPath: ImageConstant.imgCalendar,
                                          height: getSize(20.00),
                                          width: getSize(20.00))
                                    ]))),
                        // CustomDropDown(
                        //     width: 380,
                        //     focusNode: FocusNode(),
                        //     icon: Container(
                        //         margin: getMargin(left: 30, right: 20),
                        //         child: CustomImageView(
                        //             svgPath: ImageConstant.imgArrowdown)),
                        //     hintText: "Email",
                        //     margin: getMargin(top: 24),
                        //     items: controller
                        //         .fillProfileModelObj.value.dropdownItemList,
                        //     onChanged: (value) {
                        //       controller.onSelected(value);
                        //     }),
                        // Container(
                        //     margin: getMargin(top: 24),
                        //     padding: getPadding(
                        //         left: 12, top: 11, right: 12, bottom: 11),
                        //     decoration: AppDecoration.fillBluegray90001.copyWith(
                        //         borderRadius: BorderRadiusStyle.roundedBorder12),
                        //     child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.end,
                        //         children: [
                        //           CustomImageView(
                        //               svgPath: ImageConstant.imgCamera,
                        //               height: getVerticalSize(18.00),
                        //               width: getHorizontalSize(48.00),
                        //               margin: getMargin(top: 8, bottom: 8),
                        //               onTap: () {
                        //                 onTapImgCamera();
                        //               }),
                        //           Container(
                        //               width: getHorizontalSize(293.00),
                        //               margin: getMargin(left: 7, bottom: 1),
                        //               padding: getPadding(
                        //                   left: 5, top: 7, right: 5, bottom: 7),
                        //               decoration:
                        //                   AppDecoration.txtFillBluegray90001,
                        //               child: Text("Phone Number",
                        //                   overflow: TextOverflow.ellipsis,
                        //                   textAlign: TextAlign.left,
                        //                   style: AppStyle
                        //                       .txtUrbanistRegular14Gray500
                        //                       .copyWith(letterSpacing: 0.20)))
                        //         ])),
                        // CustomTextFormField(
                        //   width: 380,
                        //   focusNode: FocusNode(),
                        //   controller: controller.genderController,
                        //   hintText: "Gender",
                        //   margin: getMargin(top: 24),
                        //   padding: TextFormFieldPadding.PaddingT19,
                        //   fontStyle: TextFormFieldFontStyle.UrbanistRegular14,
                        //   textInputAction: TextInputAction.done,
                        //   suffix: Container(
                        //     margin: getMargin(
                        //         left: 30, top: 18, right: 20, bottom: 18),
                        //     child: DropdownButton(
                        //       value: "Item 1",
                        //       icon: const Icon(Icons.keyboard_arrow_down),
                        //       items: items.map((String items) {
                        //         return DropdownMenuItem(
                        //           value: items,
                        //           child: Text(items),
                        //         );
                        //       }).toList(),
                        //       onChanged: (value) {},
                        //     ),
                        //     // child: CustomImageView(
                        //     //     svgPath: ImageConstant.imgFavorite),
                        //   ),
                        //   suffixConstraints: BoxConstraints(
                        //     minWidth: getHorizontalSize(20.00),
                        //     minHeight: getVerticalSize(20.00),
                        //   ),
                        // ),
                        Row(
                          children: [
                            Container(
                              margin: getMargin(top: 24),
                              padding: getPadding(
                                  left: 12, top: 11, right: 12, bottom: 11),
                              decoration: AppDecoration.fillBluegray90001
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder12),
                              child: CustomDropDown(
                                  width: 140,
                                  focusNode: FocusNode(),
                                  icon: Container(
                                      margin: getMargin(left: 30, right: 20),
                                      child: CustomImageView(
                                          svgPath: ImageConstant.imgArrowdown)),
                                  hintText: "Gender",
                                  margin: getMargin(top: 0),
                                  items: controller.fill_Info_ModelObj.value
                                      .dropdownItemList,
                                  onChanged: (value) {
                                    controller.onSelected(value);
                                  }),
                            ),
                          ],
                        ),
                        CustomTextFormField(
                            width: 380,
                            focusNode: FocusNode(),
                            controller: controller.phoneController,
                            hintText: "Phone Number",
                            margin: getMargin(top: 24),
                            fontStyle:
                                TextFormFieldFontStyle.UrbanistRegular14),
                        CustomTextFormField(
                            width: 380,
                            focusNode: FocusNode(),
                            controller: controller.clinicController,
                            hintText: "Clinic's Address",
                            margin: getMargin(top: 24),
                            fontStyle:
                                TextFormFieldFontStyle.UrbanistRegular14),
                        CustomTextFormField(
                            width: 380,
                            focusNode: FocusNode(),
                            controller: controller.resedentialController,
                            hintText: "Residential Address",
                            margin: getMargin(top: 24),
                            fontStyle:
                                TextFormFieldFontStyle.UrbanistRegular14),
                        // CustomTextFormField(
                        //     width: 380,
                        //     focusNode: FocusNode(),
                        //     controller: controller.emailController,
                        //     hintText: "Email",
                        //     margin: getMargin(top: 24),
                        //     fontStyle:
                        //         TextFormFieldFontStyle.UrbanistRegular14),
                        // CustomTextFormField(
                        //     width: 380,
                        //     focusNode: FocusNode(),
                        //     controller: controller.passwordController,
                        //     hintText: "Password",
                        //     margin: getMargin(top: 24),
                        //     fontStyle:
                        //         TextFormFieldFontStyle.UrbanistRegular14),
                        CustomButton(
                            onTap: () {
                              controller.saveUser();
                              Get.toNamed(AppRoutes.homescreen);
                            },
                            height: 55,
                            width: 380,
                            text: "Continue",
                            margin: getMargin(top: 63, bottom: 5),
                            variant: ButtonVariant.FillCyan600)
                      ])),
            )));
  }

  Future<void> onTapDateofbirth() async {
    DateTime? dateTime = await showDatePicker(
        context: Get.context!,
        initialDate: controller.fill_Info_ModelObj.value.selectedLabelTxt,
        firstDate: DateTime(1970),
        lastDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day));
    if (dateTime != null) {
      controller.fill_Info_ModelObj.value.selectedLabelTxt = dateTime;
      controller.fill_Info_ModelObj.value.labelTxt.value =
          dateTime.format(DD_MM_YYYY);
    }
  }

  onTapImgCamera() async {
    // await PermissionManager.askForPermission(Permission.camera);
    // await PermissionManager.askForPermission(Permission.storage);
    // List<String?>? imageList = [];
    // await FileManager().showModelSheetForImage(getImages: (value) async {
    //   imageList = value;
    // });
  }

  onTapArrowleft() {
    Get.back();
  }
}
