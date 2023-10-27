import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app3/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app3/Login.dart';
class profile extends StatefulWidget {

  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {

  User? user;
  var data;
  var logEmail;
  var logName;
  var logType;

  @override
  void initState()
  {
    super.initState();
    profileDetaile();
    userProfile();
  }

  Future<void> profileDetaile() async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    logEmail =await prefs.getString('email');
    logName =await prefs.getString('name');
    logType =await prefs.getString('type');


  }
Future<void> logout() async{
    print("logout started");
    SharedPreferences prefs=await SharedPreferences.getInstance();

    await prefs.remove('email');
    await prefs.remove('password');
    await prefs.remove('type');
    await prefs.remove('name');

    Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=>login()));

}

  Future<void> userProfile() async{
    print("started");
  final response=await http.post(Uri.parse("https://sphinx-372511.de.r.appspot.com/api/users/scan"),body: ({'uid':'4117WVX'}));
  final body= response.body;
  data=jsonDecode(body);

   //user=data["users"];
    //print(user);

    setState(() {
      user = User.fromJson(data['users'][0]);


      //pas = User.fromJson(data['users'][0]['passes'][0]);
    });
    print(user?.events.toString());
    profileDetaile();

}



  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black,
      child: Column(
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


          Text("Hi,\t\t\t${logName}",style: TextStyle(fontSize: 30,color: Colors.white),),
          SizedBox(height: 20,),
          Text("Email ID:${logEmail}",style: TextStyle(fontSize: 22,color: Colors.white),),
          SizedBox(height: 30,),
          Text("User type: ${logType}",style: TextStyle(fontSize: 22,color: Colors.white),),
          SizedBox(height: 100,),
          Text("click on the logout ",style: TextStyle(fontSize: 18,color: Colors.white),),
          Center(child: ElevatedButton(onPressed: (){
            logout();
          }, child: Text("Log out"))),

          Container(
            // width: double.infinity,
            // height: 200,
              alignment: Alignment.bottomRight,
              child: Image(image: AssetImage('assets/images/Group 61.png'),
                height:200,

              )),
        ],
      ),
    )



    );
  }
}
