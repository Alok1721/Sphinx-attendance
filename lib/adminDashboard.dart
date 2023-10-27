import 'package:flutter/material.dart';
import 'package:app3/event.dart';
import 'package:app3/scanner.dart';
import 'package:app3/api.dart';
import 'package:app3/detaile.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/services.dart';
import 'package:app3/profile.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:app3/model/eventAdmin.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:app3/AdminEvent.dart';

class adminDashboard extends StatefulWidget {
  var user_name;

  adminDashboard({Key? my, this.user_name}) : super(key: my);

  @override
  State createState() => _adminDashboardState();
}

class _adminDashboardState extends State<adminDashboard> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String? selectedValue;
  var data;

  //User dum=User(name: "dummy");
  List<User> users = [];
  List<String> events = [];
  List PassAdminId = [];
  var eventAdminId;
  int eventIndex = 0;
  String eventName='';

  String _scanBarcodeResult = "Scan a barcode"; // Initial result text

  @override
  void initState() {
    super.initState();
    // scanBarcodeNormal();
    eventAdmin();
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.BARCODE,
      );
      debugPrint(barcodeScanRes);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AdminEvent(
                uid: barcodeScanRes,
                adminID: users[eventIndex]?.id.toString(),eventName: eventName,
              )));
    } on PlatformException {
      barcodeScanRes = 'Failed to execute';
    }
    if (!mounted) return;
    setState(() {
      _scanBarcodeResult = barcodeScanRes;
    });
  }

  Future<void> eventAdmin() async {
    var url = Uri.parse(
        "https://sphinx-372511.de.r.appspot.com/api/events/eventadmin");
    var response = await http.get(url, headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IjY1MTMwY2I1ZGY0YmJiZjUwYWViMzdkNyIsImlhdCI6MTY5ODI2MTc1MX0.HJ5fAReyUX26BYn0mrOjZL2l3izVv60mfK4uK252vYE'
    });
    //print(response.body);

    data = jsonDecode(response.body);
    print(data["events"]);
    List<User> dum = [];
    for (Map<String, dynamic> userData in data["events"]) {
      setState(() {
        users.add(User.fromJson(userData));

        events.add(userData["name"]);
        PassAdminId.add(userData["id"]);
      });
    }
    /* for (Map<String, dynamic> userEvent in data["events"]['name']) {

      setState(() {
        events.add(User.fromJson(userEvent));

      });
    }*/

    print("detaile of events\n\n");
    print("image url :${users[0]?.imageUrl.toString()}");
    print("event name:${events[4]}");
    print("event admin id:${PassAdminId[0]}");

    print(users[0]?.id.toString());
    print(users.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(title: Text("User Dashboard")),*/
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          Container(
              width: 200,
              height: 200,
              alignment: Alignment.topLeft,
              child: Image(image: AssetImage('assets/images/Group 62.png'))),
          SizedBox(
            height: 0,
          ),

          InkWell(
            child: Center(
              child: Container(
                width: 220,
                height: 240,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "TAP to SCAN",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Raleway'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Icon(
                      Icons.qr_code,
                      color: Colors.black,
                      size: 150,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "QR code",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Raleway'),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white70,
                    boxShadow: [
                      BoxShadow(spreadRadius: 3, color: Colors.orange),
                    ]),
              ),
            ),
            onTap: () {
              scanBarcodeNormal();
            },
          ),

          SizedBox(
            height: 15,
          ),
          Center(
            child: Text(
              'Scan Result:${_scanBarcodeResult}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          /*Builder(
              builder: (context) {
                return ListView.builder(
                  itemCount:  users?.length,
                  itemBuilder: (BuildContext context, int index) {
                    String eventname =users[index]?.name ??" ";
                    String eventid =users[index]?.id ??" ";
                    String eventImg =users[index]?.imageUrl ??" ";
                    return Card(
                      // You can adjust the height as needed
                      child: Column(children: [
                        Text("Event name $index: $eventname"),
                        Text("Event id $index: $eventid"),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.network(
                              eventImg
                          ),
                        ),
                      ],),
                    );
                  },
                );
              }
          ),*/
          Stack(children: [

            //IconButton(icon: Icon(Icons.info,),alignment: Alignment.centerRight,iconSize: 30,onPressed: (){},),
            Center(
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: Text(
                    'Select your event',
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: events
                      .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (String? value) {
                    setState(() {
                      selectedValue = value;
                      print("selected is:$value");
                      eventName=value.toString();

                      eventIndex = events.indexOf(value.toString());
                      print("$value at index of $eventIndex");
                      print(users[eventIndex]?.id);
                    });
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 80,
                    width: 240,
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 30,
                  ),
                  style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
                  barrierColor: Colors.black.withOpacity(0.3),
                ),
              ),
            ),



          ],)
          ,


        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange.shade50,
        items: [
          BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(Icons.event),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              AdminEvent(adminID: users[eventIndex]?.id.toString(),eventName: eventName,)));
                },
              ),
              label: 'events'),
          BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => adminDashboard()));
                },
              ),
              label: 'Dashboard'),
          BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(Icons.person_rounded),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => profile()));
                },
              ),
              label: 'Profile'),
        ],
        selectedItemColor: Colors.indigoAccent,
      ),
    );
  }
}
