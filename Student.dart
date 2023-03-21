class Student {
  final int id;
  final String name;
  final String basic_salary;
  final String gender;
  final String need;





  Student(
      {required this.id,
        required this.name,
        required this.basic_salary,
        required this.gender,
        required this.need,

        });

  factory Student.fromMap(Map<String, dynamic> json) => Student(
    id: json["id"],
    name: json["name"] ?? "",
    basic_salary: json["basic_salary"] ?? "",
    gender: json["gender"] ?? "",
    need: json["need"] ?? "",

  );

  Map<String, dynamic> toMap() =>{
    "id" : id,
    "name" : name,
    "basic_salary" : basic_salary,
    "gender" : gender,
    "need" : need,

  };

  static const String TABLE_NAME = "student";
  static const String COLUMN_ID = "id";
  static const String COLUMN_NAME = "name";
  static const String COLUMN_BASIC_SALARY = "basic_salary";
  static const String COLUMN_GENDER = "gender";
  static const String COLUMN_NEED = "need";



  static const String createTable = "CREATE TABLE $TABLE_NAME ( "
      "$COLUMN_ID INTEGER PRIMARY KEY AUTOINCREMENT, "
      "$COLUMN_NAME TEXT, "
      "$COLUMN_BASIC_SALARY TEXT, "
      "$COLUMN_GENDER TEXT, "
      "$COLUMN_NEED TEXT ) ";

}