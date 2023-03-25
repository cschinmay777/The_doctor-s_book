import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_book/screens/home_screen/models/homeScreenItemModel.dart';
import 'package:get/get.dart';

import '../../../core/constants/firebaseconstants.dart';
import '../../appointments_records/models/doctormodel.dart';
import '../models/HomeScreenModel.dart';

class HomeScreenController extends GetxController {
  Rx<HomeScreenModel> homeScreenItemModelObj = HomeScreenModel().obs;

  Future<DoctorModel> fetchData() async {
    final snapshot = await firestore
        .collection('doctors')
        .where('uid', isEqualTo: firebaseAuth.currentUser?.uid)
        .get();
    print("hi ${snapshot.docs}");
    final userdata =
        snapshot.docs.map((e) => DoctorModel.fromSnapshot(e)).single;
    return userdata;
  }
}
