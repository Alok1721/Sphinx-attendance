import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:app3/Dashboard.dart';
import 'package:http/http.dart' as http;
import 'package:app3/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app3/user_dashboard.dart';
import 'package:app3/adminDashboard.dart';

class login extends StatefulWidget {
  @override
  State createState() => _loginState();
}

class _loginState extends State<login> {
  String _name = '';
  int count = 0;
  var _email;
  var txt;
  var logName='';
  var logType='';
  var logEmail='';

  var _namec = TextEditingController();
  var emailc = TextEditingController();
  var passwordc = TextEditingController();
  List<User> users = [];
  bool isLogin = false;
  String email = '';
  String password = '';

  @override
  void initState() {
    super.initState();
    // check_if_login();
    checkLogin();
  }

  Future<void> saveLogin() async {
    print("save of email and password started");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', emailc.text.toString());
    await prefs.setString('password', passwordc.text.toString());
    await prefs.setString('name', logName);
    await prefs.setString('type', logType);
    print("save email and password are:");
    print(email.toString());
    print(password.toString());
  }

  Future<void> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? saveEmail = prefs.getString('email');
    String? savePassword = prefs.getString('password');
    print('check login started ');
    print('email are${saveEmail.toString()}');
    print('password are:${savePassword.toString()}');
    emailc.text = saveEmail.toString();
    passwordc.text = savePassword.toString();
    print("email controller in text field:${emailc.text.toString()}");

    saveEmail.toString() != null || savePassword.toString() != null
        ? login()
        : Text(' ');
  }

  Future<void> login() async {
    print("login called");
    if (passwordc.text.isNotEmpty && emailc.text.isNotEmpty) {
      print("request is send to api");
      var response = await http.post(
          Uri.parse("https://sphinx-372511.de.r.appspot.com/api/users"),
          body: ({
            'email': emailc.text.toString(),
            'password': passwordc.text.toString()
          }));
      print("response is received");

      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('statusCode is 200');
        saveLogin();
        var prof = data['profile'];
        print(prof);
        var userType = prof["type"];
        txt = prof["name"];
        logName=prof["name"];
        logType=prof["type"];
        logEmail=prof["email"];
        print(userType);
        //var pas=prof["passes"]["name"];

        // print(pas);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (_) => userType == 'participant'
                    ? uDashboard(
                        user_name: txt,
                      )
                    : adminDashboard()));

        print('login sucessfully');
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("${userType.toString()} ")));
      } else {
        print('login failed');
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid ")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("please enter correctly")));
    }
  }

  /*void check_if_login() async{
    final SharedPreferences prefs=await SharedPreferences.getInstance();

    */ /*final newuser=(prefs.getString('login'));

    if(newuser!=null)
    {
      setState(() {
        isLogin=true;
      });
      return;
    }*/ /*

    if(isLogin==true){
      */ /*Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=>Dashboard(user_name: txt,)));*/ /*
    }


  }*/

/*
  Future<void> ologin() async{
    final SharedPreferences prefs=await SharedPreferences.getInstance();
    final _email=prefs.getString("email");
    if(_email !=null){
      setState(() {
        isLogin=true;
      });
    }
  }*/

  /* Future<void> loginUser() async{
    final SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.setString("email",emailc.text );
    setState(() {
      _email=emailc.text;
      isLogin=true;
    });
    emailc.clear();

  }*/

  @override
  Widget build(BuildContext context) {
    String user_email;
    return Scaffold(
      backgroundColor: Colors.black,
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  // width: 200,
                  // height: 220,
                  alignment: Alignment.topLeft,
                  child: Image(
                      image: AssetImage('assets/images/Group 62.png'),
                      height:200,
                  )
              ),

              // Spacer(),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w400),
                      )),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        controller: emailc,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.blue)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.green)),
                          border: OutlineInputBorder(),
                          hintText: 'Enter your Email Id',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        obscureText: true,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        controller: passwordc,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.blue)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.green)),
                          border: OutlineInputBorder(),
                          focusColor: Colors.orangeAccent,
                          hintText: 'Enter password',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () => {login()}, child: Text("login"))
                  ],
                ),
              ),
              // Spacer(),

              Container(
                  // width: double.infinity,
                  // height: 200,
                  alignment: Alignment.bottomRight,
                  child: Image(image: AssetImage('assets/images/Group 61.png'),
                    height:200,

                  )),
            ],
          ),
        ));
  }
}
