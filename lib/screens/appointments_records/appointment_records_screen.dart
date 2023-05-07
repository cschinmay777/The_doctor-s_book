import 'package:doctor_book/screens/appointments_records/models/listrectanglefour2_item_model.dart';
import 'package:doctor_book/screens/appointments_records/models/patient_model.dart';
import 'package:doctor_book/screens/appointments_records/widgets/listrectanglefour2_item_widget.dart';
import 'package:doctor_book/screens/appointments_records/widgets/patient_tile.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../Routes/app_routes.dart';
import '../../core/constants/color_constants.dart';
import '../../core/utils/image_constants.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_style.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_search_view.dart';
import '../home_screen/home_screen.dart';
import 'controllers/appointment_page_controller.dart';

class AppointmentPageScreen extends GetWidget<AppointmentPageController> {
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
                onTap: () {}),
            centerTitle: true,
            title: AppbarTitle(text: "Today's Appointment")),
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: getPadding(
                left: 24,
                top: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // CustomSearchView(
                  //   width: 380,
                  //   focusNode: FocusNode(),
                  //   controller: controller.searchBarController,
                  //   hintText: "Search ",
                  //   prefix: Container(
                  //     margin: getMargin(
                  //       left: 20,
                  //       top: 18,
                  //       right: 12,
                  //       bottom: 18,
                  //     ),
                  //     child: CustomImageView(
                  //       svgPath: ImageConstant.imgSearch,
                  //     ),
                  //   ),
                  //   prefixConstraints: BoxConstraints(
                  //     minWidth: getSize(
                  //       20.00,
                  //     ),
                  //     minHeight: getSize(
                  //       20.00,
                  //     ),
                  //   ),
                  //   suffix: Padding(
                  //     padding: EdgeInsets.only(
                  //       right: getHorizontalSize(
                  //         15.00,
                  //       ),
                  //     ),
                  //     child: IconButton(
                  //       onPressed: () {
                  //         controller.searchBarController.clear;
                  //       },
                  //       icon: Icon(
                  //         Icons.clear,
                  //         color: Colors.grey.shade600,
                  //       ),
                  //     ),
                  //   ),
                  //   suffixConstraints: BoxConstraints(
                  //     minWidth: getHorizontalSize(
                  //       20.00,
                  //     ),
                  //     minHeight: getVerticalSize(
                  //       20.00,
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: getPadding(
                      top: 24,
                      right: 24,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: getPadding(
                            top: 2,
                            bottom: 3,
                          ),
                          child: Text(
                            "  Records : ",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtUrbanistRomanBold18,
                          ),
                        ),
                        // CustomImageView(
                        //   svgPath: ImageConstant.imgMenu28x68,
                        //   height: getVerticalSize(
                        //     28.00,
                        //   ),
                        //   width: getHorizontalSize(
                        //     68.00,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 22,
                      right: 24,
                    ),
                    child: Obx(
                      () => ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.searchList.length,
                        itemBuilder: (context, index) {
                          Patient model = controller.searchList[index];
                          print(controller.searchList[index].next);
                          String d = "${DateTime.now().day}";
                          String m = "${DateTime.now().month}";
                          if (d.length == 1) {
                            d = "0${DateTime.now().day}";
                          }
                          if (m.length == 1) {
                            m = "0${DateTime.now().month}";
                          }
                          print(
                              "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}");
                          return ((controller.searchList[index].next)
                                      .toString() ==
                                  "${d}/${m}/${DateTime.now().year}")
                              ? PatientListTile(
                                  model,
                                )
                              : Center();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // bottomNavigationBar: CustomBottomBar(
        //   onChanged: (BottomBarEnum type) {
        //     Get.toNamed(getCurrentRoute(type), id: 1);
        //   },
        // ),
      ),
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homescreen;
      case BottomBarEnum.Search:
        return AppRoutes.homescreen;
      case BottomBarEnum.Booking:
        return AppRoutes.homescreen;
      case BottomBarEnum.Profile:
        return AppRoutes.homescreen;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homescreen:
        return HomeScreen();
      case AppRoutes.homescreen:
        return HomeScreen();
      case AppRoutes.homescreen:
        return HomeScreen();
      case AppRoutes.homescreen:
        return HomeScreen();
      default:
        return DefaultWidget();
    }
  }
}
