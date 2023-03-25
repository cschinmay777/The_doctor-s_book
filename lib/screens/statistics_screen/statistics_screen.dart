import 'dart:math';

import 'package:doctor_book/screens/statistics_screen/controller/statistics_controller.dart';
import 'package:get/get.dart';

import '../../Routes/app_routes.dart';
import '../../core/constants/color_constants.dart';
import '../../core/utils/size_utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../theme/app_style.dart';
import 'widgets/statistics_screen_body.dart';

class StatisticsScreen extends StatelessWidget {
  StatisticsScreen({super.key});

  final StatisticsController statisticsController = Get.put(StatisticsController());

  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  String capitalCase(String text) {
    return text.split(' ').map((word) => word[0].toUpperCase() + word.substring(1)).join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.gray900,
      appBar: AppBar(
        backgroundColor: ColorConstant.gray800,
        leading: IconButton(
          onPressed: () => Get.toNamed(AppRoutes.searchrecord),
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Statistics',
          style: AppStyle.txtUrbanistRomanBold18.copyWith(fontSize: getFontSize(25)),
        ),
      ),
      body: FutureBuilder(
        future: statisticsController.getStatistics(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return StatisticsScreenContent(snapshot.data);
            } else {
              return Center(
                child: Text(
                  'No data',
                  style: AppStyle.txtUrbanistRomanBold18
                      .copyWith(fontSize: getFontSize(25), color: Colors.white),
                ),
              );
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
