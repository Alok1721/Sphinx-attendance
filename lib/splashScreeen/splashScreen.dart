import 'dart:async';

import 'package:flutter/material.dart';
import 'package:app3/Login.dart';
class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                login()
            )
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(width: double.infinity,height: double.infinity,color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(width: double.infinity,height: 200,alignment: Alignment.topLeft, child: Image(image: AssetImage('assets/images/Group 62.png'))),
              Container(width: 200,height: 200,alignment: Alignment.center, child: Image(image: AssetImage('assets/images/icon.png'))),

              SizedBox(height: 150,),
              Container(width: double.infinity,height: 200,alignment: Alignment.bottomRight, child: Image(image: AssetImage('assets/images/Group 61.png'))),
            ],
          ),
        ),
      ),
    );
  }
}
