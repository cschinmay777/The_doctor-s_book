import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
import 'controller/add_record_screen_controller.dart';

class AddNewRecord extends GetWidget<AddRecordPageController>{
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
                    onTap: (){}),
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
                            //controller: ,
                            hintText: "Full Name",
                            margin: getMargin(top: 24),
                            fontStyle:
                            TextFormFieldFontStyle.UrbanistRegular14),

                        // GestureDetector(
                        //     onTap: () {
                        //      // onTapDateofbirth();
                        //     },
                        //     child: Container(
                        //         margin: getMargin(top: 24),
                        //         padding: getPadding(
                        //             left: 20, top: 18, right: 20, bottom: 18),
                        //         decoration: AppDecoration.fillBluegray90001
                        //             .copyWith(
                        //             borderRadius:
                        //             BorderRadiusStyle.roundedBorder12),
                        //         child: Row(
                        //             mainAxisAlignment:
                        //             MainAxisAlignment.spaceBetween,
                        //             children: [
                        //               Padding(
                        //                   padding:
                        //                   getPadding(top: 1, bottom: 1),
                        //                   child: Obx(() => Text(
                        //                       // controller.fill_Info_ModelObj
                        //                       //     .value.labelTxt.value,
                        //                        'Hello',
                        //                       overflow: TextOverflow.ellipsis,
                        //                       textAlign: TextAlign.left,
                        //                       style: AppStyle
                        //                           .txtUrbanistRegular14Gray500
                        //                           .copyWith(
                        //                           letterSpacing: 0.20)))),
                        //               CustomImageView(
                        //                   svgPath: ImageConstant.imgCalendar,
                        //                   height: getSize(20.00),
                        //                   width: getSize(20.00))
                        //             ]))),

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
                                  // items: controller.fill_Info_ModelObj.value
                                  //     .dropdownItemList,
                                  onChanged: (value) {
                                    // controller.onSelected(value);
                                  }),
                            ),
                          ],
                        ),
                        CustomTextFormField(
                            width: 380,
                            focusNode: FocusNode(),
                            // controller: controller.phoneController,
                            hintText: "Phone Number",
                            margin: getMargin(top: 24),
                            fontStyle:
                            TextFormFieldFontStyle.UrbanistRegular14),
                        CustomTextFormField(
                            width: 380,
                            focusNode: FocusNode(),
                            // controller: controller.clinicController,
                            hintText: "Clinic's Address",
                            margin: getMargin(top: 24),
                            fontStyle:
                            TextFormFieldFontStyle.UrbanistRegular14),
                        CustomTextFormField(
                            width: 380,
                            focusNode: FocusNode(),
                            // controller: controller.resedentialController,
                            hintText: "Residential Address",
                            margin: getMargin(top: 24),
                            fontStyle:
                            TextFormFieldFontStyle.UrbanistRegular14),
                        CustomButton(
                            onTap: () {
                              // Get.toNamed(AppRoutes.homescreen);
                            },
                            height: 55,
                            width: 380,
                            text: "Continue",
                            margin: getMargin(top: 63, bottom: 5),
                            variant: ButtonVariant.FillCyan600)
                      ])),
            )));
  }
}

// Future<void> onTapDateofbirth() async {
//   DateTime? dateTime = await showDatePicker(
//       context: Get.context!,
//       initialDate: controller.fill_Info_ModelObj.value.selectedLabelTxt,
//       firstDate: DateTime(1970),
//       lastDate: DateTime(
//           DateTime.now().year, DateTime.now().month, DateTime.now().day));
//   if (dateTime != null) {
//     controller.fill_Info_ModelObj.value.selectedLabelTxt = dateTime;
//     controller.fill_Info_ModelObj.value.labelTxt.value =
//         dateTime.format(DD_MM_YYYY);
//   }
// }

onTapArrowleft() {
  Get.back();
}