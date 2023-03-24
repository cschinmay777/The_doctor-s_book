import 'package:doctor_book/core/constants/firebaseconstants.dart';
import 'package:doctor_book/screens/home_screen/home_screen.dart';
import 'package:doctor_book/screens/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Decision extends StatelessWidget {
  const Decision({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.data == null) {
            return Welcome_Screen();
          }
          return HomeScreen();
        });
  }
}
