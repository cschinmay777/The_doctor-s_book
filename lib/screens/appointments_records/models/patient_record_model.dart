import 'package:cloud_firestore/cloud_firestore.dart';

class PatientRecord {
  int? date;
  List? symptoms;
  List? prescription;

  PatientRecord({this.date, this.symptoms, this.prescription});

  PatientRecord.fromJson(Map<String, dynamic> json) {
    // date = (json["date"] as Timestamp).toDate();
    date = json["date"];
    symptoms = json["symptoms"];
    prescription = json["prescription"];
  }
}
