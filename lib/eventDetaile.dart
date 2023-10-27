import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:app3/model/eventAdmin.dart';

class eventDetaile extends StatefulWidget {
  const eventDetaile({super.key});

  @override
  State<eventDetaile> createState() => _eventDetaileState();
}

class _eventDetaileState extends State<eventDetaile> {
  var data;
  //User dum=User(name: "dummy");
  List<User> users = [];


  @override
  void initState()
  {
    super.initState();
    eventAdmin();
  }


  Future<void> eventAdmin() async {
    var url = Uri.parse(
        "https://sphinx-372511.de.r.appspot.com/api/events/eventadmin");
    var response = await http.get(url, headers: {

      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IjY1MTMwY2I1ZGY0YmJiZjUwYWViMzdkNyIsImlhdCI6MTY5ODI2MTc1MX0.HJ5fAReyUX26BYn0mrOjZL2l3izVv60mfK4uK252vYE'
    }
    );
    //print(response.body);

    data = jsonDecode(response.body);
    print(data["events"]);
    List<User> dum = [];
    for (Map<String, dynamic> userData in data["events"]) {

      setState(() {
        users.add(User.fromJson(userData));
      });
    }


    print("detaile of events\n\n");
    print("user are :${users[0]?.imageUrl.toString()}");

    print(users[0]?.id.toString());
    print(users.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: /*ListView.builder(
          itemCount: users?.length ,
          itemBuilder: (BuildContext context, int index){
        String eventname = users[index]?.name ??" ";
        return Card(child: Text("Event ID $index: $eventname"),);

      })*/
      Builder(builder: (context) {
      return ListView.builder(
        itemCount: users?.length,
        itemBuilder: (BuildContext context, int index) {
          String eventname = users[index]?.name ?? " ";
          String eventid = users[index]?.id ?? " ";
          String eventImg = users[index]?.imageUrl ?? " ";
          return Card(
            // You can adjust the height as needed
            child: Column(
              children: [
                Text("Event name $index: $eventname"),
                Text("Event id $index: $eventid"),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(eventImg),
                ),
              ],
            ),
          );
        },
      );
    })
        /*Column(children: [
     //   Card(child: Text("event name:${users[0]?.name.toString()}"),)
        Card(
          child: Text("event name: ${users.isNotEmpty ? users[0]?.name.toString() : 'No data'}"),
        )


      ],)*/


    );
  }


 
}
