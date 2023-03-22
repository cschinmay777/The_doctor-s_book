import 'package:doctor_book/screens/home_screen/models/homeScreenItemModel.dart';
import 'package:get/get.dart';

import '../models/HomeScreenModel.dart';

class HomeScreenController extends GetxController {
  Rx<HomeScreenModel> homeScreenItemModelObj = HomeScreenModel().obs;
}
