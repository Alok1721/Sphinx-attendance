import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:app3/event.dart';
import 'package:app3/Dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barcode Scanner Example',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),

      home: ScanScreen(),
    );
  }
}

class ScanScreen extends StatefulWidget {




  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {



  String _scanBarcodeResult = "Scan a barcode"; // Initial result text


  @override
  void initState()
  {
    super.initState();
    scanBarcodeNormal();
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
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>event(uid:barcodeScanRes)));

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
      appBar: AppBar(
        title: Text('QR code scan'),
        leading: IconButton(icon: Icon(Icons.arrow_back,color:Colors.black),
          onPressed:()=>Navigator.of(context).pop(),


          ), backgroundColor: Colors.orange.shade300,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: scanBarcodeNormal,
              style: ElevatedButton.styleFrom(primary: Colors.orange.shade600 ),
              child: Text('Start QR code scan'),
            ),
            SizedBox(height: 20),
            Text(
              'Scan Result:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              _scanBarcodeResult,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(backgroundColor: Colors.orange.shade50,items:
      [
        BottomNavigationBarItem(icon: IconButton(icon: Icon(Icons.event), onPressed: () { Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=>event())); },),label:'events'),
        BottomNavigationBarItem(icon: IconButton(icon: Icon(Icons.home), onPressed: () { Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=>Dashboard())); },),label:'Dashboard'),
        BottomNavigationBarItem(icon: IconButton(icon: Icon(Icons.qr_code), onPressed: () { Navigator.push(context,MaterialPageRoute(builder: (_)=>ScanScreen())); },),label:'Scanner'),
      ],
      ),
    );
  }
}