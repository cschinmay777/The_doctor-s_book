import 'package:doctor_book/Routes/app_routes.dart';
import 'package:doctor_book/core/constants/color_constants.dart';
import 'package:doctor_book/screens/patient_record_screen/patient_record_screen.dart';
import 'package:doctor_book/screens/search_records/models/patient_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientListTile extends StatelessWidget {
  final Patient patient;
  final int index;
  const PatientListTile(this.patient, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
        onPressed: () =>
            Navigator.push(context, MaterialPageRoute(builder: (context) {
          return PatientRecordScreen(patient, index);
        })),
        // Get.toNamed(AppRoutes.patientrecord, arguments: [patient, index]),
        icon: Icon(
          Icons.arrow_forward_rounded,
          color: ColorConstant.gray400,
        ),
      ),
    );
  }
}
