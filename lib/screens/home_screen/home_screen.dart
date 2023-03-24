import 'package:doctor_book/Routes/app_routes.dart';
import 'package:doctor_book/screens/home_screen/controllers/home_screen_controller.dart';
import 'package:doctor_book/screens/home_screen/models/homeScreenItemModel.dart';
import 'package:doctor_book/screens/home_screen/widgets/homeScreenCardWidget.dart';
import 'package:doctor_book/theme/app_style.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/constants/color_constants.dart';
import '../../core/utils/image_constants.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_decoration.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

class HomeScreen extends GetWidget<HomeScreenController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray900,
        // appBar: CustomAppBar(
        //     height: getVerticalSize(56.00),
        //     leadingWidth: 52,
        //     leading: AppbarImage(
        //         height: getSize(28.00),
        //         width: getSize(28.00),
        //         svgPath: ImageConstant.imgArrowleft,
        //         margin: getMargin(left: 24, top: 10, bottom: 15),
        //         onTap: onTapArrowleft6),
        //     title:
        //         AppbarTitle(text: "DashBoard", margin: getMargin(left: 16)),
        //     actions: [
        //       AppbarImage(
        //           height: getSize(28.00),
        //           width: getSize(28.00),
        //           svgPath: ImageConstant.imgMenu1,
        //           margin: getMargin(left: 24, top: 10, bottom: 15)),
        //       AppbarImage(
        //           height: getSize(28.00),
        //           width: getSize(28.00),
        //           svgPath: ImageConstant.imgGrid,
        //           margin:
        //               getMargin(left: 20, top: 10, right: 24, bottom: 15))
        //     ]),
        body: SingleChildScrollView(
          child: Container(
            margin: getMargin(left: 24, top: 26, right: 24),
            decoration: AppDecoration.fillGray900,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: getPadding(
                    left: 18,
                    top: 20,
                    right: 10,
                    bottom: 20,
                  ),
                  decoration: AppDecoration.outlineBlack9000c.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder20,
                  ),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: getPadding(left: 10, top: 50),
                            child: Text(
                              "Hello !!!",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 24,
                                  color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: getPadding(left: 10, top: 10, bottom: 5),
                            child: Text(
                              "Dr. Shekhar.. ",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: 'Urbanist',
                                  fontSize: 48,
                                  color: ColorConstant.cyan60001,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: getPadding(left: 75, top: 5, bottom: 30),
                            child: Text(
                              "Let's start our work",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 24,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      // Lottie.asset('assets/lottie/pap.json',
                      //     height: 65, width: 90),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.appointmentpagerecord);
                          },
                          child: HomeScreenCardWidget(
                            HomeScreenItemModel(
                                title: "Today's Appointments",
                                imgaddr: 'assets/images/docs.png'),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: HomeScreenCardWidget(
                            HomeScreenItemModel(
                                title: "Add New Record",
                                imgaddr: 'assets/images/appt.png'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              AppRoutes.searchrecord,
                            );
                          },
                          child: HomeScreenCardWidget(
                            HomeScreenItemModel(
                                title: "Search Old Record",
                                imgaddr: 'assets/images/search2.png'),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: HomeScreenCardWidget(
                            HomeScreenItemModel(
                                title: "Community Chats",
                                imgaddr: 'assets/images/messaging.png'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // Obx(() => GridView.builder(
                //     shrinkWrap: true,
                //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //         mainAxisExtent: getVerticalSize(281.00),
                //         crossAxisCount: 2,
                //         mainAxisSpacing: getHorizontalSize(24.00),
                //         crossAxisSpacing: getHorizontalSize(24.00)),
                //     physics: BouncingScrollPhysics(),
                //     itemCount: controller
                //         .homeScreenItemModelObj.value.homeScreenItemList.length,
                //     itemBuilder: (context, index) {
                //       HomeScreenItemModel model = controller
                //           .homeScreenItemModelObj
                //           .value
                //           .homeScreenItemList[index];
                //       return HomeScreenCardWidget(model);
                //     })),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onTapArrowleft6() {
    Get.back();
  }
}