import 'package:cloud_firestore/cloud_firestore.dart';

class PatientRecord{
  DateTime? date;
  List? symptoms;
  List? prescription; 

  PatientRecord({this.date, this.symptoms, this.prescription});

  PatientRecord.fromJson(Map<String, dynamic> json) {
    date = (json["date"] as Timestamp).toDate();
    symptoms = json["symptoms"];
    prescription = json["prescription"];
  }
}