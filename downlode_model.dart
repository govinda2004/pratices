
import 'dart:convert';

List<Welcome> welcomeFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome({
    required this.name,
    required this.basic_salary,
    required this.gender,
    required this.need,
  });


  String name;
  String basic_salary;
  String gender;
  String need;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
   // employeeId: json["employee_id"],
    name: json["name"],
    basic_salary: json["basic_salary"],
    gender: json["gender"],
    need: json["need"],
  );

  Map<String, dynamic> toJson() => {
    //"employee_id": employeeId,
    "name": name,
    "basic_salary": basic_salary,
    "gender": gender,
    "need": need,
  };
}


class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
