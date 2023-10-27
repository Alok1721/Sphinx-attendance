import 'package:flutter/material.dart';
import 'package:app3/event.dart';
import 'package:app3/scanner.dart';
import 'package:app3/api.dart';
import 'package:app3/detaile.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/services.dart';
import 'package:app3/profile.dart';

class uDashboard extends StatefulWidget {
  var user_name;

  uDashboard({Key? my, this.user_name}) : super(key: my);

  @override
  State createState() => _uDashboardState();
}

class _uDashboardState extends State<uDashboard> {
  String _scanBarcodeResult = "Scan a barcode"; // Initial result text

  @override
  void initState() {
    super.initState();
    // scanBarcodeNormal();
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
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => event(uid: barcodeScanRes)));
    } on PlatformException {
      barcodeScanRes = 'Failed to execute';
    }
    if (!mounted) return;
    setState(() {
      _scanBarcodeResult = barcodeScanRes;
    });
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
            height: 50,
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
              'Scan Result:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Text(
              _scanBarcodeResult,
              style: TextStyle(fontSize: 18),
            ),
          ),
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
                      context, MaterialPageRoute(builder: (_) => event(uid:_scanBarcodeResult,)));
                },
              ),
              label: 'events'),
          BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => uDashboard()));
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
