import 'package:cloud_firestore/cloud_firestore.dart';

class PatientRecord {
  DateTime? date;
  List? symptoms;
  String? prescription;

  PatientRecord({this.date, this.symptoms, this.prescription});

  PatientRecord.fromJson(Map<String, dynamic> json) {
    date = (json["date"] as Timestamp).toDate();
    // date = json["date"];
    symptoms = json["symptoms"] as List<dynamic>;
    prescription = json["prescription"];
  }
}
