
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;
//import 'Modal.dart';
import 'downlode_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Welcome> welcome = [];
  // getData();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context,snapshot){
          if(
          snapshot.hasData){
            return ListView.builder(
                itemCount:welcome.length,
                itemBuilder: (context,index){
                  return Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    height: 350,
                    color: Colors.lightGreen[200],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('name: ${welcome[index].name}', style: TextStyle(fontSize: 16),),
                        Text('salary: ${welcome[index].basic_salary}', style: TextStyle(fontSize: 16),),
                        Text('gender: ${welcome[index].gender}', style: TextStyle(fontSize: 16),),
                        Text('need: ${welcome[index].need}', style: TextStyle(fontSize: 16),),


                      ],
                    ),

                  );
                }
            );
          }

          else{
            return Center(child: CircularProgressIndicator(),);
          }

        });
  }

  Future<List<Welcome>> getData() async{
    final response =await http.get(Uri.parse('http://stage.rksk.in/api/download_emp.php'));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      for(Map<String,dynamic> index in data){
        welcome.add(Welcome.fromJson(index));
      }
      return welcome;
    }else{
      return welcome;
    }
  }
}

