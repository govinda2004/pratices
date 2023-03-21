// import 'package:dio/dio.dart';
// import 'package:get/get.dart';
//
//
//
// import 'List_model.dart';
//
// class GetDataController extends GetxController{
//
//   // @override
//   // void onInit() {
//   //   // TODO: implement onInit
//   //   super.onInit();
//   // }
//
//   var isLoading = false.obs;
//   var getDataModel = ListDummy(empId: '', name: '', basicSalary: '', gender: null, need: '').obs;
//
//   getDataFromApi() async {
//     isLoading.value = true;
//     try {
//       var response = await Dio().get('http://api.open-notify.org/astros.json');
//       getDataModel.value = ListDummy.fromJson(response.data);
//       print(response);
//       isLoading.value = false;
//     } catch (e) {
//       print(e);
//     }
//   }
//
// }
