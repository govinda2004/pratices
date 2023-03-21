import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);


  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SlidingSheet(
        elevation: 8,
        cornerRadius: 25,
        snapSpec: const SnapSpec(
          snap: true,
          snappings: [0.9,0.9,1.0],
          positioning: SnapPositioning.relativeToAvailableSpace,
          
        ),
        body: Padding(
            padding:const EdgeInsets.symmetric(horizontal: 5,vertical: 110,),
        child: Container(
          padding: EdgeInsets.only(left: 30),
          child: Text('RASHTRIYA KISHOR\nSWASTHYA KARYAKARAM(RKSK)',style: TextStyle(
            color: Colors.white,fontSize: 20,

          ),),
        ),

        ),
        builder: (context,state){
          return Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.10,
                right: 15,
                left: 15),
             height:500 ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  child: Image.asset('assets/logo-9.png',width: 120,height: 100,),

                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(

                    prefixIcon: const Icon(Icons.email),
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Enter Your Email',
                    labelText: 'Email*',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the password';
                    }
                    return null;
                  },

                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(_obscureText
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Enter Your password',
                    labelText: 'Password*',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(

                    child: const Text('Login'),
                    onPressed: () {Navigator.pushNamed(context, 'Registration');
                      //Fluttertoast.showToast(msg: "Welcome to Registration page", backgroundColor:Colors.blue);
                    },
                    style: ElevatedButton.styleFrom(

                      primary: Colors.cyan,
                      // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

              ],

            ),
          );
        }

      ),
    );
  }
}
