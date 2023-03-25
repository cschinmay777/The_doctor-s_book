import 'package:doctor_book/core/utils/date_time_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Routes/app_routes.dart';
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

class AddNewRecord extends StatefulWidget {
  const AddNewRecord({Key? key}) : super(key: key);

  @override
  State<AddNewRecord> createState() => _AddNewRecordState();
}

class _AddNewRecordState extends State<AddNewRecord> {
  var controller = Get.put(AddRecordPageController());
  @override
  void initState()
  {
    super.initState();
    controller.symptoms = new List<String>.empty(growable: true);
    controller.symptoms.add("");
  }
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
                    onTap: () {
                      Get.off(AppRoutes.homescreen);
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "Fill Your Profile")),
            body: SingleChildScrollView(
              child: Container(
                  width: size.width,
                  padding: getPadding(left: 24, top: 40, right: 24, bottom: 40),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //Image
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
                        //Name
                        CustomTextFormField(
                            width: 380,
                            focusNode: FocusNode(),
                            controller: controller.nameController,
                            hintText: "Full Name",
                            margin: getMargin(top: 24),
                            fontStyle:
                                TextFormFieldFontStyle.UrbanistRegular14),
                        //Gender
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
                                  items: controller.add_new_record_ModelObj
                                      .value.dropdownItemList,
                                  onChanged: (value) {
                                    controller.onSelected(value);
                                  }),
                            ),
                          ],
                        ),
                        CustomTextFormField(
                            width: 380,
                            focusNode: FocusNode(),
                            controller: controller.ageController,
                            hintText: "Age",
                            margin: getMargin(top: 24),
                            fontStyle:
                                TextFormFieldFontStyle.UrbanistRegular14),
                        //Number
                        CustomTextFormField(
                            width: 380,
                            focusNode: FocusNode(),
                            controller: controller.numberController,
                            hintText: "Phone number",
                            margin: getMargin(top: 24),
                            fontStyle:
                                TextFormFieldFontStyle.UrbanistRegular14),
                        //Address
                        CustomTextFormField(
                            width: 380,
                            focusNode: FocusNode(),
                            controller: controller.addressController,
                            hintText: "Residential Address",
                            margin: getMargin(top: 24),
                            fontStyle:
                                TextFormFieldFontStyle.UrbanistRegular14),
                        //Record
                        Row(
                          children: [
                            Container(
                                padding: EdgeInsetsDirectional.all(10),
                                margin: getMargin(top: 10, bottom: 10),
                                //color:ColorConstant.gray500,
                                // height: size.height*0.1,
                                // width: size.width*0.9 ,
                                child: Text(
                                  'Records',
                                  style:
                                      AppStyle.txtUrbanistRomanBold24.copyWith(
                                    color: ColorConstant.whiteA700,
                                  ),
                                )),
                            // CustomImageView(
                            //   svgPath: ImageConstant.imgPlus,
                            //   height: getVerticalSize(24.00),
                            //   width: getHorizontalSize(23.00),
                            //   alignment: Alignment.center,
                            //   onTap: (){
                            //     //Get.toNamed(AppRoutes.appointmentpagerecord);
                            //   },
                            // )
                          ],
                        ),
                        //Date
                        GestureDetector(
                            onTap: () {
                              onTapRecordDate();
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
                                              controller.add_new_record_ModelObj
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
                        //Weight
                        CustomTextFormField(
                            width: 380,
                            focusNode: FocusNode(),
                            controller: controller.weightController,
                            hintText: "Weight",
                            margin: getMargin(top: 24),
                            fontStyle:
                                TextFormFieldFontStyle.UrbanistRegular14),
                        //Temperature
                        CustomTextFormField(
                            width: 380,
                            focusNode: FocusNode(),
                            controller: controller.temperatureController,
                            hintText: "Temperature  F",
                            margin: getMargin(top: 24),
                            fontStyle:
                                TextFormFieldFontStyle.UrbanistRegular14),
                        //BP
                        CustomTextFormField(
                            width: 380,
                            focusNode: FocusNode(),
                            controller: controller.bpController,
                            hintText: "Blood Pressure",
                            margin: getMargin(top: 24),
                            fontStyle:
                                TextFormFieldFontStyle.UrbanistRegular14),
                        //Symptoms
                        SymptomsContainer(),
                        CustomTextFormField(
                            width: 380,
                            focusNode: FocusNode(),
                            controller: controller.prescriptionController,
                            hintText: "Prescription",
                            margin: getMargin(top: 24),
                            fontStyle:
                            TextFormFieldFontStyle.UrbanistRegular14),
                        // SingleChildScrollView(
                        //   child: Column(
                        //     children: [
                        //       Container(
                        //           padding: EdgeInsetsDirectional.all(10),
                        //           margin: getMargin(top: 10,bottom: 10),
                        //           child: Text(
                        //             'Symptoms',
                        //             style: AppStyle.txtUrbanistRomanBold24.copyWith(
                        //               color: ColorConstant.whiteA700,
                        //             ),
                        //           )
                        //       ),
                        //       Card(
                        //         margin: EdgeInsets.all(20),
                        //         child: Padding(
                        //           padding: const EdgeInsets.all(10.0),
                        //           child: Row(
                        //             children: [
                        //               Expanded(
                        //                 child: CustomTextFormField(
                        //                   controller: controller.symptomController,
                        //                 )
                        //               ),
                        //               IconButton(
                        //                 icon: Icon(Icons.add),
                        //                 onPressed: () {
                        //                   //Function to add that value in the database
                        //                 },
                        //               )
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //
                        //     ],
                        //   ),
                        // ),
                        //Continue Button
                        CustomButton(
                            onTap: () {
                              Get.toNamed(AppRoutes.homescreen);
                              Get.snackbar("Successful", "Patient added in the database",colorText: Colors.white ,snackPosition: SnackPosition.BOTTOM ,backgroundColor: ColorConstant.cyan60001);
                            },
                            height: 55,
                            width: 380,
                            text: "Continue",
                            margin: getMargin(top: 63, bottom: 5),
                            variant: ButtonVariant.FillCyan600)
                      ])),
            )));
  }

  Future<void> onTapRecordDate() async {
    DateTime? dateTime = await showDatePicker(
        context: Get.context!,
        initialDate: controller.add_new_record_ModelObj.value.selectedLabelTxt,
        firstDate: DateTime(1970),
        lastDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day));
    if (dateTime != null) {
      controller.add_new_record_ModelObj.value.selectedLabelTxt = dateTime;
      controller.add_new_record_ModelObj.value.labelTxt.value =
          dateTime.format(DD_MM_YYYY);
    }
  }

  onTapArrowleft() {
    Get.back();
  }

  Widget SymptomsContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsetsDirectional.all(10),
          margin: getMargin(top: 10, bottom: 10),
          child: Text(
            'Symptoms',
            style: AppStyle.txtUrbanistRomanBold24.copyWith(
              color: ColorConstant.whiteA700,
            ),
          ),
        ),
        ListView.separated(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (context,index) {
              return Column(
                children: [
                  SymptomUI(index),
                ],
              );
            },
            separatorBuilder: (context,index) => const Divider(),
            itemCount: controller.symptoms!.length,
        )
      ],
    );
  }

  Widget SymptomUI(index) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Row(children: [
          Flexible(
            child: CustomTextFormField(
                width: 380,
                focusNode: FocusNode(),
                //controller: ,
                hintText: "Symptom",
                margin: getMargin(top: 24),
                fontStyle: TextFormFieldFontStyle.UrbanistRegular14),
          ),
          Visibility(
            child: SizedBox(
                width: 35,
                child: IconButton(
                    onPressed: () {
                      addSymptomControl();
                    },
                    icon: Icon(Icons.add_circle, color: Colors.white))),
            visible: index == controller.symptoms.length - 1,
          ),
          Visibility(
            child: SizedBox(
                width: 35,
                child: IconButton(
                    onPressed: () {
                      removeSymptomControl(index);
                    },
                    icon: Icon(Icons.remove_circle, color: Colors.white))),
            visible: index > 0,
          ),
        ]));
  }

  void addSymptomControl(){
    setState(() {
      controller.symptoms!.add("");
    });
  }

  void removeSymptomControl(index){
    setState(() {
      if(controller.symptoms.length>1)
        {
          controller.symptoms.removeAt(index);
        }
    });
  }
}
