import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:login/resturl.dart';

import 'Sqflite.dart';
import 'Student.dart';

class Myform extends StatefulWidget {
  const Myform({Key? key}) : super(key: key);

  @override
  State<Myform> createState() => _MyformState();
}

class _MyformState extends State<Myform> {
  String? sub = "";

  // final List<String> genderItems = [
  //   '1',
  //   '2',
  //   '3',
  //   '4',
  //   '5',
  //   '6',
  //   '7',
  //   '8',
  //   '9',
  //   '10',
  // ];

  String? selectedValue = "";
  String? Gender = "";
  String? name = "";
  String? basic_salary = "";
  String? need = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name = "";
    basic_salary = "";
    Gender = "";
    need = "";
    selectedValue = "";
  }

  final _formKey = GlobalKey<FormState>();
  List<String> subjects = ['Job', 'Education', 'Livelihood', 'Security'];

  List<String> selectedSubjects = [];
  TextEditingController textName = TextEditingController();
  TextEditingController textSalary = TextEditingController();
  TextEditingController textSubject = TextEditingController();

  //TextEditingController textAge = TextEditingController();
  List<Student> userList = [];
  Sqflite databaseHelper = Sqflite();
  Dio dio = Dio();
  String url = 'http://stage.rksk.in/api/reg_form.php';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Registration Form'),
          ),
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05,
                    right: 15,
                    left: 15,
                    bottom: 30,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter the name';
                            }
                            return null;
                          },
                          controller: textName,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 1.0,
                              ),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Enter your Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Basic Salary",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter the basic salary';
                            }
                            return null;
                          },
                          controller: textSalary,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 1.0,
                              ),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Enter your Basic Salary',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Gender",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),

                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: RadioListTile(
                                selectedTileColor: Colors.indigo,
                                activeColor: Colors.indigo,
                                //tileColor: Colors.white,
                                title: Text(
                                  "Male",
                                  style: TextStyle(fontSize: 15),
                                ),
                                value: "Male",
                                groupValue: Gender,
                                onChanged: (value) {
                                  setState(() {
                                    Gender = value.toString();
                                  });
                                },
                              ),
                            ),
                            // SizedBox(
                            //   width: 1,
                            // ),
                            // const Text('Male'),
                            Expanded(
                              child: RadioListTile(
                                selectedTileColor: Colors.indigo,
                                activeColor: Colors.indigo,
                                title: Text(
                                  "Female",
                                  style: TextStyle(fontSize: 15),
                                ),
                                value: "Female",
                                groupValue: Gender,
                                onChanged: (value) {
                                  setState(() {
                                    Gender = value.toString();
                                  });
                                },
                              ),
                            ),

                            // Expanded(
                            //   child: RadioListTile(
                            //     selectedTileColor: Colors.indigo,
                            //     activeColor: Colors.indigo,
                            //     title: Text(
                            //       "Other",
                            //       style: TextStyle(fontSize: 15),
                            //     ),
                            //     value: "Other",
                            //     groupValue: Gender,
                            //     onChanged: (value) {
                            //       setState(() {
                            //         Gender = value.toString();
                            //       });
                            //     },
                            //   ),
                            // ),
                          ],
                        ),

                        //SizedBox(height: 10,),
                        // DropdownButtonFormField2(
                        //   decoration: InputDecoration(
                        //     //Add isDense true and zero Padding.
                        //     //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                        //     isDense: true,
                        //     contentPadding: EdgeInsets.zero,
                        //     enabledBorder: OutlineInputBorder(
                        //       // width: 0.0 produces a thin "hairline" border
                        //       borderSide:
                        //       BorderSide(color: Colors.blue, width: 1.0,),
                        //     ),
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(8),
                        //     ),
                        //     //Add more decoration as you want here
                        //     //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                        //   ),
                        //   isExpanded: true,
                        //   hint: const Text(
                        //     'Select Your Class',
                        //     style: TextStyle(fontSize: 16),
                        //   ),
                        //   icon: const Icon(
                        //     Icons.arrow_drop_down,
                        //     color: Colors.black45,
                        //   ),
                        //   iconSize: 30,
                        //   buttonHeight: 50,
                        //   buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                        //   dropdownDecoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(15),
                        //   ),
                        //   items: genderItems
                        //       .map((item) =>
                        //       DropdownMenuItem<String>(
                        //         value: item,
                        //         child: Text(
                        //           item,
                        //           style: const TextStyle(
                        //             fontSize: 14,
                        //           ),
                        //         ),
                        //       ))
                        //       .toList(),
                        //   validator: (value) {
                        //     if (value == null) {
                        //       return 'Please Select Class.';
                        //     }
                        //   },
                        //   onChanged: (value) {
                        //     //Do something when changing the item if you want.
                        //     selectedValue = value;
                        //   },
                        //
                        // ),
                        SizedBox(
                          height: 20,
                        ),

                        Text(
                          "You need",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: subjects.map((obj) {
                            return CheckboxListTile(
                              title: Text(obj),
                              value: selectedSubjects.contains(obj),
                              onChanged: (value) {
                                print("vaule $value");
                                setState(() {
                                  if (value!) {
                                    selectedSubjects.add(obj);
                                    sub = (sub! + obj);
                                  } else {
                                    selectedSubjects.remove(obj);
                                  }
                                });
                              },
                            );
                          }).toList(),
                        ),

                        // Text(
                        //   "Age",
                        //   style: TextStyle(
                        //       color: Colors.black,
                        //       fontSize: 16,
                        //       fontWeight: FontWeight.w500),
                        // ),
                        // SizedBox(height: 10,),
                        // TextFormField(
                        //   validator: (value) {
                        //     if (value!.isEmpty) {
                        //       return 'Please enter the age';
                        //     }
                        //     return null;
                        //   },
                        //   controller:textAge,
                        //   decoration: InputDecoration(
                        //     enabledBorder: OutlineInputBorder(
                        //       // width: 0.0 produces a thin "hairline" border
                        //       borderSide:
                        //       BorderSide(color: Colors.blue, width: 1.0,),
                        //     ),
                        //     fillColor: Colors.white,
                        //     filled: true,
                        //     hintText: 'Enter your Age',
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(8),
                        //     ),
                        //     contentPadding: EdgeInsets.symmetric(horizontal: 12),
                        //   ),
                        //   keyboardType: TextInputType.number,
                        //   maxLength: 3,
                        //   inputFormatters: <TextInputFormatter>[
                        //     FilteringTextInputFormatter.digitsOnly
                        //   ],
                        //
                        // ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.height * 0.29,
                          ),
                          child: Container(
                            height: 45,
                            child: ElevatedButton(
                              child: const Text('Submit'),
                              onPressed: () async {
                                // genderItems.remove(selectedValue);
                                // if (_formKey.currentState!.validate()) {
                                //
                                //   textName.clear();
                                //   textSalary.clear();
                                //  // textAge.clear();
                                // print('Add to db');
                                // }
                                // await Center(child: CircularProgressIndicator(),);
                                checkUserCanLogin();
                              },
                              style: ElevatedButton.styleFrom(
                                // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                                textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> checkUserCanLogin() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      if (!_formKey.currentState!.validate()) {
        return;
      } else {
        await _createAccToDb();
      }
    } else {
      checkInternet();
    }
  }

  Future<void> _createAccToDb() async {
    Map<String, dynamic> data = {
      "name": textName.text,
      "basic_salary": textSalary.text,
      "gender": Gender,
      "need": selectedSubjects.join(","),
      // add more key-value pairs as needed
    };
    FormAPI(data);
    await databaseHelper.insertRecord(data, 'student');
  }

  Future<void> FormAPI(Map<String, dynamic> data) async {
    try {
      Response response = await dio.post(url, data: data);
      // handle the response as needed
    } catch (e) {
      // handle any errors that occur
    }
    await Center(
      child: CircularProgressIndicator(),
    );
    Navigator.pushNamed(context, 'list');
    print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
  }

  Future<void> checkInternet() async {
    showModalBottomSheet<void>(
      backgroundColor: Colors.indigo,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Please check your internet connection",
                  style: TextStyle(color: Colors.deepOrange, fontSize: 12)),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.indigo,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Ok".toUpperCase(),
                    style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
            ],
          ),
        );
      },
    );
  }

  // Future<void> checkUserCanLogin() async {
  //   bool result = await InternetConnectionChecker().hasConnection;
  //   if (result == true) {
  //     if (!_formKey.currentState!.validate()) {
  //       return;
  //     } else {
  //       await _createAccToDb();
  //
  //     }
  //   } else {
  //     checkInternet();
  //   }
  // }
  //
  // Future<void> _createAccToDb() async {
  //   Map<String, dynamic> data = {
  //     "name": textName.text,
  //     "salary": textSalary.text,
  //     "gender": Gender,
  //     "need": selectedSubjects.join(","),
  //     // "rwa": "Not Applicable",
  //     // "state_id": "1",
  //     // "city_id": "1",
  //     // "address": _addressCon.text,
  //     // "role_id": "2",
  //   };
  //   databaseHelper.insertRecord(data, 'student');
  //   debugPrint(" DB successfully submit  yggggggggggggggggggggggggggggggggggggg");
  //   await FormAPI(data);
  // }
  //
  //
  // Future<void> FormAPI(Map<String, dynamic> data) async {
  //   SmartDialog.showLoading(backDismiss: false, clickMaskDismiss: false);
  //   try {
  //     Response response = await dio.post(
  //      'http://stage.rksk.in/api/reg_form.php',
  //       data: jsonEncode(data),
  //     );
  //     print('nfhndnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnhndhggggggggggggggg');
  //     Map<String, dynamic> resData = jsonDecode(response.data);
  //     debugPrint("Nahi chal raha haaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ${data}");
  //
  //     if (response.statusCode == 200) {
  //       if (resData['status'].toString() == "1") {
  //         debugPrint("RESDATA ${resData}");
  //
  //         // Navigator.pushNamedAndRemoveUntil(context, RoutesName.questionScreen,
  //         //     (Route<dynamic> route) => false);
  //         SmartDialog.dismiss();
  //         debugPrint("message ${resData['message']}");
  //         SmartDialog.showToast(resData['message']);
  //       }
  //       if (resData['status'].toString() == "0") {
  //         SmartDialog.showToast(resData['message']);
  //         debugPrint("message ${resData['message']}");
  //         SmartDialog.dismiss();
  //       }
  //     }
  //   } catch (e) {
  //     SmartDialog.showToast("RRRRR ${e.toString()}");
  //     debugPrint("RRRRR ${e.toString()}");
  //     SmartDialog.dismiss();
  //   }
  // }
  //
  // Future<void> checkInternet() async {
  //   showModalBottomSheet<void>(
  //     backgroundColor: Colors.indigo,
  //     context: context,
  //     builder: (BuildContext context) {
  //       return SizedBox(
  //         height: 50,
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             Text("Please check your internet connection",
  //                 style: TextStyle(color: Colors.deepOrange, fontSize: 12)),
  //             TextButton(
  //               style: TextButton.styleFrom(
  //                 foregroundColor: Colors.indigo,
  //               ),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //               child: Text("Ok".toUpperCase(),
  //                   style: TextStyle(color: Colors.white, fontSize: 12)),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  // void _createAccToDb() {
  //   Map<String, dynamic> data = {
  //     "name": textName.text,
  //     "salary":textSalary.text,
  //     'gender':Gender,
  //     "need":selectedSubjects.join(","),
  //    // "age": textAge.text,
  //   };
  //   //print(data);
  //
  //   Sqflite.internal().insertStudent(data);
  //   Sqflite.internal().queryAllRowsData().then((value) {
  //     setState(() {
  //       userList = value.cast<Student>();
  //
  //       print("data insert ${value.length}");
  //     });
  //   });
  // }
}
