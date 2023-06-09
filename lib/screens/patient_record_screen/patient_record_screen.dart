import 'dart:developer';

import 'package:doctor_book/Routes/app_routes.dart';
import 'package:doctor_book/core/utils/size_utils.dart';
import 'package:doctor_book/screens/add_existing_patient_record/add_existing_patient_record.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/color_constants.dart';
import '../../theme/app_style.dart';
import '../search_records/models/patient_model.dart';

class PatientRecordScreen extends StatelessWidget {
  final Patient patient;
  final int index;
  // final List lst;
  PatientRecordScreen(this.patient, this.index, {super.key});
  List pres = [];
  // String capitalCase(String text) {
  //
  //   return text
  //       .split(',')
  //       .map((word) => word[0].toUpperCase() + word.substring(1))
  //       .join(' ');
  // }
  List<String> PrescriptionList(String text) {
    return text.split(',');
  }

  @override
  Widget build(BuildContext context) {
    // var d = Get.arguments();
    // print(Get.arguments);
    // print(pres);
    // print(index);
    log(patient.records!.length.toString());
    return Scaffold(
      backgroundColor: ColorConstant.gray900,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddExistingNewRecord(index);
          }));
          // Get.toNamed(AppRoutes.addexistingpatientrecord, arguments: index);
        },
      ),
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
          'Patient Record',
          style: AppStyle.txtUrbanistRomanBold18
              .copyWith(fontSize: getFontSize(25)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                  ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    title: Text(
                      patient.name!,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      patient.age.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_downward_rounded,
                        color: ColorConstant.gray400,
                      ),
                    ),
                  )
                ] +
                List.generate(
                  patient.records!.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Record of ${patient.records![index].date!.day}/${patient.records![index].date!.month}/${patient.records![index].date!.year}',
                          style: AppStyle.txtUrbanistRomanBold18
                              .copyWith(fontSize: getFontSize(35)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Symptoms',
                                    style: AppStyle.txtUrbanistRomanBold18
                                        .copyWith(
                                      fontSize: getFontSize(25),
                                      color: ColorConstant.gray100,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: List.generate(
                                      patient.records![index].symptoms!.length,
                                      (index1) => Text(
                                        patient
                                            .records![index].symptoms![index1],
                                        // capitalCase(
                                        //     '${index1 + 1}. ${patient.records![index].symptoms![index1]}'),
                                        style: AppStyle.txtUrbanistRomanBold18
                                            .copyWith(
                                          fontSize: getFontSize(20),
                                          color: ColorConstant.gray400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Prescription',
                                    style: AppStyle.txtUrbanistRomanBold18
                                        .copyWith(
                                      fontSize: getFontSize(25),
                                      color: ColorConstant.gray100,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: List.generate(
                                      PrescriptionList(
                                              "${patient.records![index].prescription} ")
                                          .length,
                                      (index1) => Text(
                                        PrescriptionList(
                                                "${patient.records![index].prescription} ")[
                                            index1],
                                        // capitalCase(
                                        //     '${index1 + 1}. ${patient.records![index].symptoms![index1]}'),
                                        style: AppStyle.txtUrbanistRomanBold18
                                            .copyWith(
                                          fontSize: getFontSize(20),
                                          color: ColorConstant.gray400,
                                        ),
                                      ),
                                    ),
                                    // children: List.generate(
                                    //   patient
                                    //       .records![index].prescription!.length,
                                    //   (index1) => Text(
                                    //     patient.records![index]
                                    //         .prescription![index1],
                                    //     // capitalCase(
                                    //     //     '${index1 + 1}. ${patient.records![index].prescription![index1]}'),
                                    //     style: AppStyle.txtUrbanistRomanBold18
                                    //         .copyWith(
                                    //       fontSize: getFontSize(20),
                                    //       color: ColorConstant.gray400,
                                    //     ),
                                    //   ),
                                    // ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
