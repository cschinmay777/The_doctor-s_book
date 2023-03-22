import 'package:get/get.dart';

import 'homeScreenItemModel.dart';

class HomeScreenModel {
  RxList<HomeScreenItemModel> homeScreenItemList = RxList<HomeScreenItemModel>([
    HomeScreenItemModel(
        title: "Today's Appointments", imgaddr: 'assets/images/docs.png'),
    HomeScreenItemModel(
        title: "Add New Record", imgaddr: 'assets/images/appt.png'),
    HomeScreenItemModel(
        title: "Search Old Record", imgaddr: 'assets/images/search2.png'),
    HomeScreenItemModel(
        title: "Community Chats", imgaddr: 'assets/images/messaging.png'),
  ]);
  // RxList.filled(4, HomeScreenItemModel());
}
