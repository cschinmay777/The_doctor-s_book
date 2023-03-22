import 'package:doctor_book/screens/search_records/widgets/listrectanglefour2_item_widget.dart';
import 'package:doctor_book/screens/search_records/widgets/listsizemediumtypefilled_item_widget.dart';
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
import 'models/listrectanglefour2_item_model.dart';
import 'models/listsizemediumfilled_item_model.dart';

class SearchPageScreen extends GetWidget<SearchPageController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray900,
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
                  CustomSearchView(
                    width: 380,
                    focusNode: FocusNode(),
                    controller: controller.searchBarController,
                    hintText: "Search ",
                    prefix: Container(
                      margin: getMargin(
                        left: 20,
                        top: 18,
                        right: 12,
                        bottom: 18,
                      ),
                      child: CustomImageView(
                        svgPath: ImageConstant.imgSearch,
                      ),
                    ),
                    prefixConstraints: BoxConstraints(
                      minWidth: getSize(
                        20.00,
                      ),
                      minHeight: getSize(
                        20.00,
                      ),
                    ),
                    suffix: Padding(
                      padding: EdgeInsets.only(
                        right: getHorizontalSize(
                          15.00,
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {
                          controller.searchBarController.clear;
                        },
                        icon: Icon(
                          Icons.clear,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                    suffixConstraints: BoxConstraints(
                      minWidth: getHorizontalSize(
                        20.00,
                      ),
                      minHeight: getVerticalSize(
                        20.00,
                      ),
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
                        itemCount: controller.searchPageModelObj.value
                            .listrectanglefour2ItemList.length,
                        itemBuilder: (context, index) {
                          Listrectanglefour2ItemModel model = controller
                              .searchPageModelObj
                              .value
                              .listrectanglefour2ItemList[index];
                          return Listrectanglefour2ItemWidget(
                            model,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomBar(
          onChanged: (BottomBarEnum type) {
            Get.toNamed(getCurrentRoute(type), id: 1);
          },
        ),
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
