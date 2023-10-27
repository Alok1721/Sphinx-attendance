import 'dart:convert';
import 'package:app3/model/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class detaile extends StatefulWidget {
  const detaile({Key? key});

  @override
  State<detaile> createState() => _detaileState();
}

class _detaileState extends State<detaile> {
  List<User> users = [];
  Future<List<User>> getUserApi() async {
    try {
      final response = await http.post(
        Uri.https('sphinx-372511.de.r.appspot.com','/api/users/scan'),
          );





      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data['users']);

        for (Map<String, dynamic> userData in data["users"]) {
         users.add(User.fromJson(userData));
       }

        return users;
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      // Handle the error, e.g., log the error or show an error message.
      print(e);
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Details')),
      body: FutureBuilder<List<User>>(
        future: getUserApi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text('No data available');
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Text("Email ID: ${snapshot.data![index].email.toString()}",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
                      Text("User Name: ${snapshot.data![index].name.toString()}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                      Text("User Type: ${snapshot.data![index].type.toString()}",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15),),
                     // Text("Event admin of:: ${snapshot.data![index].events}",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15),),
                      // Add other user details here as needed
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
