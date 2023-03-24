import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/firebaseconstants.dart';
import '../models/search_page_model.dart';

class AppointmentPageController extends GetxController {
  Rx<AppointmentPageModel> appointmentPageModelObj = AppointmentPageModel().obs;

  // final Rx<Map<String, dynamic>> _user = Rx<Map<String, dynamic>>({});
  // Map<String, dynamic> get user => _user.value;
  // String static_uid = "atkySVCs4IaY0eZRJS63";
  //
  // Rx<String> _uid = "".obs;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // getUserData() async {
  //   print("I am here");
  //   // List<String> thumbnails = [];
  //   // var myVideos = await firestore
  //   //     .collection('videos')
  //   //     .where('uid', isEqualTo: _uid.value)
  //   //     .get();
  //   //
  //   // for (int i = 0; i < myVideos.docs.length; i++) {
  //   //   thumbnails.add((myVideos.docs[i].data() as dynamic)['thumbnail']);
  //   // }
  //
  //   DocumentSnapshot userDoc =
  //       await firestore.collection('doctors').doc(static_uid).get();
  //   final userData = userDoc.data()! as dynamic;
  //   String name = userData['name'];
  //
  //   firestore
  //       .collection('users')
  //       .doc(_uid.value)
  //       .collection('followers')
  //       .doc(static_uid)
  //       .get()
  //       .then((value) {});
  //
  //   update();
  //   print(name);
  // }
}
