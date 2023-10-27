import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class emailSend extends StatefulWidget {
  const emailSend({super.key});

  @override
  State<emailSend> createState() => _emailSendState();
}

class _emailSendState extends State<emailSend> {

  final nameController=TextEditingController();
  final subjectController=TextEditingController();
  final emailController=TextEditingController();
  final messageContoller=TextEditingController();

  Future sendEmail() async{
    const serviceId='service_0ldnpft';
    const templateId='template_gnrpk95';
    const userId="";

    final url=Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    final response=await http.post(url,headers:{'Content-Type':'application/json'},body:json.encode(
        {"service_id":""


        }));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container()


    );
  }
}
