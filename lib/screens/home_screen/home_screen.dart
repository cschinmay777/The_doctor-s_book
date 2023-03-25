//import 'dart:js';

import 'package:doctor_book/Routes/app_routes.dart';
import 'package:doctor_book/screens/appointments_records/models/doctormodel.dart';
import 'package:doctor_book/screens/home_screen/controllers/home_screen_controller.dart';
import 'package:doctor_book/screens/home_screen/models/homeScreenItemModel.dart';
import 'package:doctor_book/screens/home_screen/widgets/homeScreenCardWidget.dart';
import 'package:doctor_book/theme/app_style.dart';
import 'package:doctor_book/widgets/custom_image_view.dart';
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

import '../login_screen/controllers/login_controller.dart';

class HomeScreen extends StatelessWidget {
  var authcontroller = Get.put(LoginController());
  var controller = Get.put(HomeScreenController());
  //var ctr = Get.put(LoginController());
  Size screenSize = WidgetsBinding.instance.window.physicalSize;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: HomeScreenController.scaffoldKey,
        drawer: Drawer(
            backgroundColor: ColorConstant.gray900,
            child:Column(
              children: [
                Expanded(
                  child: Container(
                    child: DrawerHeader(
                        padding: EdgeInsets.fromLTRB(0.2, 0, 0.2, 0),
                        child: FutureBuilder<DoctorModel>(
                            future:controller.fetchData(),
                            builder: (context,snapshot){
                              if (snapshot.connectionState != ConnectionState.done) {
                                return CircularProgressIndicator();
                              }
                              return Container(
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
                                                    "Doctor",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        fontFamily: 'Urbanist',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 24,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  getPadding(left: 10, top: 10, bottom: 5),
                                                  child: Text(
                                                    "${snapshot.data?.name}",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        fontFamily: 'Urbanist',
                                                        fontSize: 48,
                                                        color: ColorConstant.cyan60001,
                                                        fontWeight: FontWeight.w500),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            // Lottie.asset('assets/lottie/pap.json',
                                            //     height: 65, width: 90),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                              );
                            }
                        )
                    ),
                  ),
                ),
                ListTile(
                  onTap: (){},
                  leading: CustomImageView(
                    svgPath: ImageConstant.imgEdit,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Edit Profile",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                        color: Colors.white),
                  ),
                ),
                ListTile(
                  onTap: (){},
                  leading: CustomImageView(
                    svgPath: ImageConstant.imgInfo,
                  ),
                  title: Text(
                    "About Us",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                        color: Colors.white),
                  ),
                ),
                ListTile(
                  onTap: (){
                    authcontroller.signout();
                  },
                  leading: CustomImageView(
                    svgPath: ImageConstant.imgClose,
                  ),
                  title: Text(
                    "Sign Out",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                        color: Colors.white),
                  ),
                )
              ],
            )
        ),
        // appBar: CustomAppBar(
        //     height: getVerticalSize(56.00),
        //     leadingWidth: 52,
        //     leading: AppbarImage(
        //         height: getSize(28.00),
        //         width: getSize(28.00),
        //         svgPath: ImageConstant.imgMenu28x28,
        //         margin: getMargin(left: 24, top: 10, bottom: 15),
        //         onTap: (){
        //          Get.toNamed(AppRoutes.appdrawer);
        //         }
        //     ),
        //     title: AppbarTitle(
        //         text: "Doctors' Book".tr, margin: getMargin(left: 16)),
        //     ),
        backgroundColor: ColorConstant.gray900,

        body: FutureBuilder<DoctorModel>(
            future: controller.fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return CircularProgressIndicator();
              }
              print(snapshot.data?.patients);
              return SingleChildScrollView(
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
                                  padding:
                                      getPadding(left: 10, top: 10, bottom: 5),
                                  child: Text(
                                    "Dr. ${snapshot.data?.name}.. ",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontFamily: 'Urbanist',
                                        fontSize: 48,
                                        color: ColorConstant.cyan60001,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      getPadding(left: 75, top: 5, bottom: 30),
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
                                onTap: () {
                                  Get.toNamed(AppRoutes.addnewrecord);
                                },
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
                                onTap: () {
                                  authcontroller.signout();
                                },
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
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  onTapArrowleft6() {
    Get.back();
  }
}
