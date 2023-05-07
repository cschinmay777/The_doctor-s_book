import 'patient_record_model.dart';

class Patient {
  String? name;
  String? age;

  List<PatientRecord>? records;

  Patient({this.name, this.age, this.records});

  Patient.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    age = json["age"];
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

    return data;
  }
}
