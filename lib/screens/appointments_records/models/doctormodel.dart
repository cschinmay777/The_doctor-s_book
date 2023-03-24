import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorModel {
  String? name;
  String? age;
  String? uid;
  dynamic? patients;

  DoctorModel({
    required this.name,
    required this.age,
    required this.uid,
    required this.patients,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'uid': uid,
      'age': age,
      'patients': patients,
    };
  }

  factory DoctorModel.fromMap(Map<String, dynamic> map) {
    return DoctorModel(
      name: map['name'] != null ? map['name'] as String : null,
      uid: map['uid'] != null ? map['uid'] as String : null,
      age: map['age'] != null ? map['age'] as String : null,
      patients: map['patients'] != null ? map['patients'] as List : null,
    );
  }

  toJson() {
    return {"name": name, "age": age, "uid": uid, "patients": patients};
  }

  factory DoctorModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return DoctorModel(
      uid: document.id,
      name: data["name"],
      age: data["age"],
      patients: data["patients"],
    );
  }
}
