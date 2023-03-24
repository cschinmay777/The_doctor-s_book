import 'package:doctor_book/screens/search_records/models/patient_model.dart';
import 'package:flutter/material.dart';

class PatientListTile extends StatelessWidget {
  final Patient patient;
  const PatientListTile(this.patient, {super.key});

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
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.white,
      ),
    );
  }
}
