import 'package:flutter/material.dart';
//import 'package:untitled3/registration.dart';
import 'Form.dart';
import 'Sqflite.dart';
import 'Student.dart';

class ghl extends StatefulWidget {
  const ghl({Key? key}) : super(key: key);

  @override
  State<ghl> createState() => _ghlState();
}

class _ghlState extends State<ghl> {
  Sqflite sqflite = new Sqflite();

  List<Student>? taskList = [];

  get data => context;

  @override
  void initState() {
    super.initState();
    sqflite.queryAllRowsData().then((value) {
      // taskList?.clear();
      taskList = value.cast<Student>();
      setState(() {});
    });
  }
  String name = '';
  String salary ="";
  String? Gender="";

  List<String> subjects = ['Job', 'Education', 'Livelihood', 'Security'];


  List<String> selectedSubjects = [];
  String? sub="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listing"),
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: taskList!.length,
            itemBuilder: (BuildContext context, int index) {



              return Container(
                padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.blue,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                        const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Name", style: TextStyle(fontSize: 16)),
                            SizedBox(height: 2,),
                            Text("Salary", style: TextStyle(fontSize: 16)),
                            SizedBox(height: 2,),
                            Text("Gender", style: TextStyle(fontSize: 16)),
                            SizedBox(height: 2,),
                            Text("Your Need", style: TextStyle(fontSize: 16)),
                           // Text("Password", style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ':  ${taskList![index].name}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              ':  ${taskList![index].basic_salary}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              ':  ${taskList![index].gender}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              ':  ${taskList![index].need}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            // Text(
                            //   ':  ${taskList![index].password}',
                            //   style: const TextStyle(fontSize: 15),
                            // ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            child: IconButton(
                              icon: const Icon(Icons.delete_outline_outlined,
                                  color: Colors.red),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title:
                                    const Text('Are you sure want to Delete?'),
                                    actions: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(ctx).pop();
                                              },
                                              child: const Text('No')),
                                          TextButton(
                                              onPressed: () {
                                                _deleteTask(taskList![index].id);
                                                Navigator.of(ctx).pop();
                                              },
                                              child: const Text('Yes')),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),

                          ),
                          Container(
                            child: IconButton(
                              icon: const Icon(Icons.edit,
                                  color: Colors.green),
                              onPressed: () {
                                showDialog(


                                  context: context,
                                  builder: (ctx) => AlertDialog(

                                    actions: <Widget>[
                                      Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          TextFormField(
                                              initialValue: name,
                                              decoration: InputDecoration(
                                                  enabledBorder: OutlineInputBorder(
                                                    // width: 0.0 produces a thin "hairline" border
                                                    borderSide:
                                                    BorderSide(color: Colors.blue, width: 1.0,),
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  labelText: 'Name'
                                              ),
                                              onChanged: (value){
                                                name = value;
                                                setState(() {
                                                  name = value;
                                                });
                                              }
                                          ),

                                          SizedBox(height: 20,),

                                          TextFormField(
                                            initialValue: salary,
                                            decoration: InputDecoration(
                                                enabledBorder: OutlineInputBorder(
                                                  // width: 0.0 produces a thin "hairline" border
                                                  borderSide:
                                                  BorderSide(color: Colors.blue, width: 1.0,),
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                                labelText: 'Salary'
                                            ),
                                            //onChanged:  _onChanged,
                                          ),

                                          SizedBox(height: 20,),
                                          Text(
                                            "Gender",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),

                                          Row(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: RadioListTile(
                                                  selectedTileColor: Colors.indigo,
                                                  activeColor: Colors.indigo,
                                                  //tileColor: Colors.white,
                                                  title: Text(
                                                    "Male",
                                                    style: TextStyle(fontSize: 14),
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
                                                    style: TextStyle(fontSize: 14),
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


                                            ],
                                          ),

                                          SizedBox(height: 20,),

                                          Text(
                                            "You need",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(height: 10,),
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
                                                      sub=(sub!+obj);
                                                    } else {
                                                      selectedSubjects.remove(obj);
                                                    }
                                                  });
                                                },
                                              );
                                            }).toList(),
                                          ),
                                          SizedBox(height: 20,),

                                          SizedBox(
                                            width: double.infinity,
                                            height: 42,
                                            child: ElevatedButton(
                                              child: const Text('Update'),
                                              onPressed: () {
                                                //     (String value) {
                                                //   setState(() =>
                                                //   _name = 'Submit: ${value}');
                                                //   // fathers = 'Submit: ${value}');
                                                //   print('Name updated to $_name');
                                                // };
                                                setState(() {
                                                  data[index] = name;
                                                });

                                                // if (_formkey.currentState!.validate()){
                                                //   _createAccToDb();
                                                //   print('Add to db');
                                                //
                                                //   Navigator.pushNamed(context, 'list');}
                                              },
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.blue,
                                                // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                                                textStyle: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),

                                          // FloatingActionButton(
                                          //   child: Text('Submit'),
                                          //   onPressed: () {
                                          //         (String value) {
                                          //           setState(() =>
                                          //           _name = 'Submit: ${value}');
                                          //           print('Name updated to $_name');
                                          //         };
                                          //     // do something with the updated name value
                                          //
                                          //   },
                                          // ),


                                          // TextButton(
                                          //     onPressed: () {
                                          //       Navigator.of(ctx).pop();
                                          //     },
                                          //     child: const Text('No')),


                                          // TextButton(
                                          //     onPressed: () {
                                          //       _deleteTask(taskList![index].id);
                                          //       Navigator.of(ctx).pop();
                                          //     },
                                          //     child: const Text('Yes')),


                                        ],
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),

                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Myform()));
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Icon(Icons.add),
      ),
    );
  }

  //DELETE TASK
  void _deleteTask(int id) async {
    await Sqflite.internal().delete(id);
    setState(() {
      taskList!.removeWhere((element) => element.id == id);
    });
  }
}
