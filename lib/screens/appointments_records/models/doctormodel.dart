import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorModel {
  String name;
  String age;
  String uid;
  dynamic patients;

  DoctorModel({
    required this.name,
    required this.age,
    required this.uid,
    required this.patients,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
        "uid": uid,
        "patients": patients,
      };

  static DoctorModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return DoctorModel(
      age: snapshot['email'],
      uid: snapshot['uid'],
      name: snapshot['name'],
      patients: snapshot['patients'],
    );
  }
}
