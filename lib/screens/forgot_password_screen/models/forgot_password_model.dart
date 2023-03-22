import 'package:get/get.dart';
import 'listuser_item_model.dart';

class ForgotPasswordModel {
  RxList<ListuserItemModel> listuserItemList = RxList([
    ListuserItemModel(title: "Via SMS", sample: "1234567891"),
    ListuserItemModel(title: "Email", sample: "cschinmay777@gmail.com")
  ]);
  // RxList.filled(2, ListuserItemModel());
}
