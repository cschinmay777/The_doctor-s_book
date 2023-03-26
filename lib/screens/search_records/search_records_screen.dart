import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../Routes/app_routes.dart';
import '../../core/constants/color_constants.dart';
import '../../core/utils/image_constants.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_search_view.dart';
import '../home_screen/home_screen.dart';
import 'controllers/search_page_controller.dart';
import 'widgets/patient_search_tile.dart';

class SearchPageScreen extends StatelessWidget {
  final SearchPageController controller = Get.put(SearchPageController());
  final TextEditingController searchBarController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray900,
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            child: Container(
              padding: getPadding(
                left: 24,
                top: 24,
                right: 24,
                bottom: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: ColorConstant.gray800,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.search),
                          color: ColorConstant.gray400,
                        ),
                        Expanded(
                          child: TextField(
                            controller: searchBarController,
                            style: const TextStyle(color: Colors.white),
                            onChanged: (value) {
                              controller.searchBarText.value = value;
                            },
                            decoration: InputDecoration(
                              hintText: "Search",
                              hintStyle:
                                  AppStyle.txtUrbanistRomanBold18.copyWith(
                                color: Colors.white,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            controller.searchBarText.value = '';
                            searchBarController.clear();
                          },
                          icon: const Icon(Icons.clear),
                          color: ColorConstant.gray400,
                        ),
                      ],
                    ),
                  ),
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
                            "Records :",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtUrbanistRomanBold18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 22,
                    ),
                    child: Obx(
                      () {
                        if (controller.searchBarText.value == '') {
                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.searchList.length,
                            itemBuilder: (context, index) {
                              return PatientListTile(
                                  controller.searchList[index], index);
                            },
                          );
                        } else {
                          var result = controller.searchPatient();
                          if (result.isEmpty) {
                            log("No result found");
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.search_off,
                                    color: ColorConstant.gray400,
                                    size: 100,
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      top: 16,
                                    ),
                                    child: Text(
                                      "No result found",
                                      style: AppStyle.txtUrbanistRomanBold18,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: result.length,
                              itemBuilder: (context, index) {
                                return PatientListTile(result[index], index);
                              },
                            );
                          }
                        }
                      },
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
