import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/search_page_model.dart';

class SearchPageController extends GetxController {
  TextEditingController searchBarController = TextEditingController();

  Rx<SearchPageModel> searchPageModelObj = SearchPageModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    searchBarController.dispose();
  }
}
