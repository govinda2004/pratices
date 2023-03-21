
import 'dart:convert';

List<ListDummy> listDummyFromJson(String str) =>
    List<ListDummy>.from(json.decode(str).map((x) => ListDummy.fromJson(x)));

String listDummyToJson(List<ListDummy> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListDummy {
  ListDummy({
    required this.empId,
    required this.name,
    required this.basicSalary,
    required this.gender,
    required this.need,
  });

  String? empId;
  String? name;
  String? basicSalary;
  Gender? gender;
  String? need;

  factory ListDummy.fromJson(Map<String?, dynamic> json) => ListDummy(
        empId: json["emp_id"],
        name: json["name"],
        basicSalary: json["basic_salary"],
        gender: genderValues.map[json["gender"]]!,
        need: json["need"],
      );

  Map<String?, dynamic> toJson() => {
        "emp_id": empId,
        "name": name,
        "basic_salary": basicSalary,
        "gender": genderValues.reverse[gender],
        "need": need,
      };
}

enum Gender { MALE, EMPTY, FEMALE }

final genderValues = EnumValues(
    {"": Gender.EMPTY, "Female": Gender.FEMALE, "Male": Gender.MALE});

class EnumValues<T> {
  Map<String?, T> map;
  late Map<T, String?> reverseMap;

  EnumValues(this.map);

  Map<T, String?> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
