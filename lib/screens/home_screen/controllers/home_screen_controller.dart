import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_book/screens/home_screen/models/homeScreenItemModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/firebaseconstants.dart';
import '../../appointments_records/models/doctormodel.dart';
import '../models/HomeScreenModel.dart';

class HomeScreenController extends GetxController {
  Rx<HomeScreenModel> homeScreenItemModelObj = HomeScreenModel().obs;
  static final scaffoldKey = GlobalKey<ScaffoldState>();
  void openDrawer()
  {
    scaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer()
  {
    scaffoldKey.currentState?.closeEndDrawer();
  }
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
