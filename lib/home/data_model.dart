// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  DataModel({
    this.problems,
  });

  List<Problem>? problems;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        problems: List<Problem>.from(
            json["problems"].map((x) => Problem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "problems": (problems != null)
            ? List<dynamic>.from(problems!.map((x) => x.toJson()))
            : null,
      };
}

class Problem {
  Problem({
    this.diabetes,
    this.asthma,
  });

  List<Diabetes>? diabetes;
  List<Asthma>? asthma;

  factory Problem.fromJson(Map<String, dynamic> json) => Problem(
        diabetes: List<Diabetes>.from(
            json["Diabetes"].map((x) => Diabetes.fromJson(x))),
        asthma:
            List<Asthma>.from(json["Asthma"].map((x) => Asthma.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Diabetes": (diabetes != null)
            ? List<dynamic>.from(diabetes!.map((x) => x.toJson()))
            : null,
        "Asthma": (asthma != null)
            ? List<dynamic>.from(asthma!.map((x) => x.toJson()))
            : null,
      };
}

class Asthma {
  Asthma();

  factory Asthma.fromJson(Map<String, dynamic> json) => Asthma();

  Map<String, dynamic> toJson() => {};
}

class Diabetes {
  Diabetes({
    this.medications,
    this.labs,
  });

  List<Medication>? medications;
  List<Lab>? labs;

  factory Diabetes.fromJson(Map<String, dynamic> json) => Diabetes(
        medications: List<Medication>.from(
            json["medications"].map((x) => Medication.fromJson(x))),
        labs: List<Lab>.from(json["labs"].map((x) => Lab.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "medications": (medications != null)
            ? List<dynamic>.from(medications!.map((x) => x.toJson()))
            : null,
        "labs": (labs != null)
            ? List<dynamic>.from(labs!.map((x) => x.toJson()))
            : null,
      };
}

class Lab {
  Lab({
    this.missingField,
  });

  String? missingField;

  factory Lab.fromJson(Map<String, dynamic> json) => Lab(
        missingField: json["missing_field"],
      );

  Map<String, dynamic> toJson() => {
        "missing_field": missingField,
      };
}

class Medication {
  Medication({
    this.medicationsClasses,
  });

  List<MedicationsClass>? medicationsClasses;

  factory Medication.fromJson(Map<String, dynamic> json) => Medication(
        medicationsClasses: List<MedicationsClass>.from(
            json["medicationsClasses"]
                .map((x) => MedicationsClass.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "medicationsClasses": (medicationsClasses != null)
            ? List<dynamic>.from(medicationsClasses!.map((x) => x.toJson()))
            : null,
      };
}

class MedicationsClass {
  MedicationsClass({
    this.className,
    this.className2,
  });

  List<ClassName>? className;
  List<ClassName>? className2;

  factory MedicationsClass.fromJson(Map<String, dynamic> json) =>
      MedicationsClass(
        className: List<ClassName>.from(
            json["className"].map((x) => ClassName.fromJson(x))),
        className2: List<ClassName>.from(
            json["className2"].map((x) => ClassName.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "className": (className != null)
            ? List<dynamic>.from(className!.map((x) => x.toJson()))
            : null,
        "className2": (className2 != null)
            ? List<dynamic>.from(className2!.map((x) => x.toJson()))
            : null,
      };
}

class ClassName {
  ClassName({
    this.associatedDrug,
    this.associatedDrug2,
  });

  List<AssociatedDrug>? associatedDrug;
  List<AssociatedDrug>? associatedDrug2;

  factory ClassName.fromJson(Map<String, dynamic> json) => ClassName(
        associatedDrug: List<AssociatedDrug>.from(
            json["associatedDrug"].map((x) => AssociatedDrug.fromJson(x))),
        associatedDrug2: List<AssociatedDrug>.from(
            json["associatedDrug#2"].map((x) => AssociatedDrug.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "associatedDrug": (associatedDrug != null)
            ? List<dynamic>.from(associatedDrug!.map((x) => x.toJson()))
            : null,
        "associatedDrug#2": (associatedDrug2 != null)
            ? List<dynamic>.from(associatedDrug2!.map((x) => x.toJson()))
            : null,
      };
}

class AssociatedDrug {
  AssociatedDrug({
    this.name,
    this.dose,
    this.strength,
  });

  String? name;
  String? dose;
  String? strength;

  factory AssociatedDrug.fromJson(Map<String, dynamic> json) => AssociatedDrug(
        name: json["name"],
        dose: json["dose"],
        strength: json["strength"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "dose": dose,
        "strength": strength,
      };
}
