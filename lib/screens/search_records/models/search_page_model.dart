import 'package:get/get.dart';

import 'listrectanglefour2_item_model.dart';
import 'listsizemediumfilled_item_model.dart';

class SearchPageModel {
  RxList<ListsizemediumtypefilledItemModel> listsizemediumtypefilledItemList =
      RxList.filled(5, ListsizemediumtypefilledItemModel());

  RxList<Listrectanglefour2ItemModel> listrectanglefour2ItemList =
      RxList<Listrectanglefour2ItemModel>([
    Listrectanglefour2ItemModel(name: "Prathmesh Mulay", date: "23/01/2023")
  ]);
  // RxList.filled(7, Listrectanglefour2ItemModel());
}
