
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'List_model.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  List<ListDummy> listdata = [];

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getDataFromSarver();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listview'),
      ),
      body: ListView.builder(
        itemCount: listdata.length,
        itemBuilder:((context,index){
        return Text(listdata[index].name.toString());

    }),
      )
    );
  }

  Future<void> _getDataFromSarver() async {
    try{
      var response = await Dio().post('http://stage.rksk.in/api/download_emp.php');
      print(response);
      List<ListDummy> data = [];
      for(var e in response.data) {
        data.add(ListDummy.fromJson(e));
      }

      setState(() {
        listdata = data;
      });

    }catch(e){
      print(e);
    }
  }
}
























// import 'dart:async';
//
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
//
// import 'List_model.dart';
// import 'Sqflite.dart';
//
// // class ApiService {
// //   final Dio _dio = Dio();
// //
// //   Future<List<ListDummy>> getData() async {
// //     try {
// //       Response response = await _dio.post('http://stage.rksk.in/api/download_emp.php');
// //       return response.data;
// //     } catch (error) {
// //       print('Error fetching data: $error');
// //       return [];
// //     }
// //   }
// // }
//
//
// class MyScreen extends StatefulWidget {
//   @override
//   _MyScreenState createState() => _MyScreenState();
// }
//
// class _MyScreenState extends State<MyScreen> {
//    List<ListDummy> _data = [];
//
//
//   @override
//   void initState() {
//     super.initState();
//     _getData();
//   }
//   //
//   // FutureOr<void> _getData() async {
//   //   List<dynamic> data = await ApiService().getData();
//   //   setState(() {
//   //     _data = data;
//   //   });
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         itemCount: _data.length,
//         itemBuilder: (BuildContext context, int index) {
//
//           return Text(_data[index].name.toString());
//         }),
//
//          // return Text(_data[index]);
//           // return a widget to display the data at the current index
//         //},
//      // ),
//     );
//   }
//
// //DELETE TASK
// void _deleteTask(int id) async {
//   await Sqflite.internal().delete(id);
//   setState(() {
//     _data.removeWhere((element) => element.empId == id);
//   });
// }
//
//   Future<void> _getData() async {
//     try {
//       var response = await Dio().post('http://stage.rksk.in/api/download_emp.php');
//       print(response);
//       List<ListDummy> data = [];
//       for(var e in response.data){
//         data.add(ListDummy.fromJson(e));
//       }
//
//       setState(() {
//         _data = data;
//       });
//
//     }catch(e){
//       print(e);
//     }
//   }
//
//
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:get/get.dart';
// // import 'package:waterflowanimation/getDataController.dart';
// //
// // import 'list_controller.dart';
// //
// // class MyCustomWidget extends StatefulWidget {
// //   const MyCustomWidget({Key key}) : super(key: key);
// //
// //   @override
// //   State<MyCustomWidget> createState() => _MyCustomWidgetState();
// // }
// //
// // class _MyCustomWidgetState extends State<MyCustomWidget> {
// //
// //   final getDataController = Get.put(GetDataController());
// //
// //   @override
// //   void initState() {
// //     // TODO: implement initState
// //     getDataController.getDataFromApi();
// //     super.initState();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Obx(()=>Scaffold(
// //       appBar: AppBar(
// //         title: Text('GetX List'),
// //       ),
// //       body: !getDataController.isLoading.value ? ListView.builder(
// //           itemCount: getDataController.getDataModel.value.people.length,
// //           itemBuilder: (context, index){
// //             return Card(
// //                 child: Padding(
// //                   padding: const EdgeInsets.all(15.0),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text(
// //                         getDataController.getDataModel.value.people[index].craft,
// //                       ),
// //                       Text(
// //                         getDataController.getDataModel.value.people[index].name,
// //                       ),
// //                     ],
// //                   ),
// //                 )
// //             );
// //           }
// //       ) : Center(
// //           child: CircularProgressIndicator()
// //       ),
// //     ),
// //     );
// //   }
// // }
