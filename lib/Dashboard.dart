import 'package:flutter/material.dart';
import 'package:app3/event.dart';
import 'package:app3/scanner.dart';
import 'package:app3/api.dart';
import 'package:app3/detaile.dart';
import 'package:app3/model/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class Dashboard extends StatefulWidget {
   var user_name;
   Dashboard({Key? my,this.user_name}):super(key:my);

  @override
  State createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {







  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(title: Text('DASHBOARD'),),
      backgroundColor: Colors.white70,
      body: Column(
        children: [
          //Center(child: Padding(padding: const EdgeInsets.all(8.0),child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color:Colors.white54,),width:350,height:100))),
          const SizedBox(height:50),
          Padding(
            padding: const EdgeInsets.only(left: 30.0,top: 20.0),
            child: Align(alignment:Alignment.centerLeft,child: Text("hello",style: TextStyle(fontSize: 20,color: Colors.black))),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Align(alignment:Alignment.centerLeft,child: Text("${widget.user_name}",style: TextStyle(fontSize: 30,color: Colors.indigo,fontWeight: FontWeight.bold))),
          ),

          Row(
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0,top:20.0,right: 10.0),
                  child: Container(
                        child:Column(
                          children: [Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Icon(Icons.people,color: Colors.grey,size:70.0),
                          ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text('USERS \n',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue[500]),),
                            ),

                                

                          ],
                        )
                      ,decoration:BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white70),width:100,height:170),
                ),
              ),
              Expanded(flex:4,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0,top:20.0,right: 30.0),
                  child: Container(child:Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Icon(Icons.event,color: Colors.grey,size:70.0),
                      ),
                       Padding(
                         padding: const EdgeInsets.only(top: 10.0,),
                         child: Text('EVENTS\n',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue[500]),),
                       ),

                    ],
                  ),decoration:BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white70) ,width: 100,height:170,),
                ),


              ),

            ],
          ),
          Row(
            children: [
              Expanded(flex:4,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0,left: 30.0,top: 15.0),
                  child: Container(
                      child:Center(child: ElevatedButton(onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (_)=>api()));},child:Text('click'))),
                      decoration:BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white70) ,width: 100,height:170),

                ),
              ),
              Expanded(flex:4,
                child: Padding(
                  padding: const EdgeInsets.only(right: 30.0,left: 10.0,top: 15.0),
                  child: Container(child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Icon(Icons.chat,color: Colors.grey,size:70.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Column(
                          children: [ElevatedButton(onPressed: (){}, child: Text("logout",style: TextStyle(fontSize: 20),)),
                           // Text('CHATS\n',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue[500]),),
                          ],
                        ),
                      ),

                    ],
                  ),decoration:BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white70) ,width: 100,height:170,),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Center(child: Container(
                child: ElevatedButton(onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (_)=>detaile()));},child:Text('all users')),
                decoration:BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white54) ,width: 100,height:100)),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items:
      [
        BottomNavigationBarItem(icon: IconButton(icon: Icon(Icons.event), onPressed: () { Navigator.push(context,MaterialPageRoute(builder: (_)=>event())); },),label:'events'),
        BottomNavigationBarItem(icon: IconButton(icon: Icon(Icons.home), onPressed: () { Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=>Dashboard())); },),label:'Dashboard'),
        BottomNavigationBarItem(icon: IconButton(icon: Icon(Icons.qr_code), onPressed: () { Navigator.push(context,MaterialPageRoute(builder: (_)=>ScanScreen())); },),label:'Scanner'),
      ],
      ),
    );
  }
}
