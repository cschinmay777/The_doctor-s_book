import 'package:cloud_firestore/cloud_firestore.dart';

import 'patient_record_model.dart';

class Patient {
  String? name;
  String? age;
  List? records;
  String? next;
  String? phone;

  Patient({this.name, this.age, this.records, this.next});

  Patient.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    age = json["age"];
    next = json["next"];
    phone = json["phone"];
    // next = (json["next"] as Timestamp).toDate();
    records = json["records"] != null
        ? (json["records"] as List<dynamic>?)!
            .map((e) => PatientRecord.fromJson(e))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["age"] = age;
    data["records"] = records;
    data["next"] = next;
    data["phone"] = phone;
    return data;
  }
}
