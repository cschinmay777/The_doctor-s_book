import 'package:cloud_firestore/cloud_firestore.dart';

class AddPatientRecord {
  String? address;
  String? age;
  String? gender;
  String? name;
  String? next;
  String? phone;
  List? records;

  AddPatientRecord(
      {this.address,
      this.age,
      this.gender,
      this.name,
      this.next,
      this.phone,
      this.records});

  AddPatientRecord.fromJson(Map<String, dynamic> json) {
    // date = (json["date"] as Timestamp).toDate();
    // date = json["date"];
    address = json["address"];
    age = json["age"];
    gender = json["gender"];
    name = json["name"];
    next = json["next"];
    phone = json["phone"];
    records = json["records"];
  }
}
