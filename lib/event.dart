import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app3/test.dart';
import 'model/user.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:gradient_slide_to_act/gradient_slide_to_act.dart';
import 'package:slidable_button/slidable_button.dart';
import 'package:app3/eventDetaile.dart';
import 'package:intl/intl.dart';

class event extends StatefulWidget {
  final uid;

  const event({super.key, this.uid});

  @override
  State createState() => _eventState();
}

class _eventState extends State<event> {
  User? user;
  User? pas;
  var data;
  double currentValue = 1;
  double newSlider = 1;
  var result;
  bool rresult = false;
  late int index;
  var passName='';

  @override
  void initState() {
    super.initState();
    checkApi();

  }





  Future<void> checkApi() async {
    print(widget.uid);
    var url = Uri.https("sphinx-372511.de.r.appspot.com", "/api/users/scan");
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'uid':widget.uid,
      }),
    );
    print(response.body);

    data = jsonDecode(response.body);
    // print(data['users'][0]["passes"][1]["name"]);
    //print(data['users']['passes']);
    print("user data is :\n\n\n");
    print(data['users']);
    print("events data is :\n\n\n");
    //print(data['users'][0]['events'][1]['event']);

    print(user?.events);
    // print(data['users'][0]['events']);

    print(user?.events.toString());
    setState(() {
      user = User.fromJson(data['users'][0]);

      //pas = User.fromJson(data['users'][0]['passes'][0]);
    });

    //print(user);
    // print("response status:${response}");
    // print("response body:${response.body}");
    //child:Text('this is body of api,${response.body}');
    print("he has pass of ${user?.passes?[0]?.name}");
    print("present data and time:${DateFormat.d().format(DateTime.now()).toString()}");
    passesName();


  }

  Future<void> passesName() async {
    print(user?.passes?[0]?.name);
    if ((user?.passes?[0]?.name) == 'Platinum Pass' ||
        (user?.passes?[0]?.name) == 'Golden Pass') {
      setState(() {
        passName = 'GIVE BAND';
      });
    }
    else if((user?.passes?[0]?.name)=='First Day' && (DateFormat.d().format(DateTime.now()).toString())=='3')
      {
        setState(() {
          passName = 'GIVE BAND';
        });

      }
    else if((user?.passes?[0]?.name)=='Second Day' && (DateFormat.d().format(DateTime.now()).toString())=='4')
    {
      setState(() {
        passName = 'GIVE BAND';
      });

    }
    else if((user?.passes?[0]?.name)=='Third Day' && (DateFormat.d().format(DateTime.now()).toString())=='5')
    {
      setState(() {
        passName = 'GIVE BAND';
      });

    }
    else if((user?.passes?[0]?.name.toString())=='School Pass' && (DateFormat.d().format(DateTime.now()).toString())=='27')
    {
      setState(() {
        passName = 'GIVE BAND';
      });

    }
    else if((user?.passes?[0]?.name.toString())=='Day 1' ||(user?.passes?[0]?.name.toString())=='Day 2' ||(user?.passes?[0]?.name.toString())=='Day 3' )

      {
        setState(() {
        passName = 'NO Band';
      });

      }
    else
    {
     setState(() {
       passName='No Band';
     });
    }



  }

  @override
  Widget build(BuildContext context) {
    // user['passes'].forEach((v) {
    //   events!.add(v);
    // });

    return Scaffold(
        appBar: AppBar(
          title: Text('EVENTS PAGE(MAIN GATE)'),
          leading: IconButton(
              color: Colors.black,
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop()),
          backgroundColor: Colors.orange.shade300,
        ),
        body: Center(
            child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              children: [
                /*    ElevatedButton(onPressed: ()async{


                    }, style: ElevatedButton.styleFrom(primary: Colors.orange.shade600 ),child:Text("Details")),*/

                //Card(child: ListTile(title:Text(pas?.name?? " "))),

                // ListTile(title: Text(user?.name ?? " "),tileColor: Colors.red,),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Container(
                    width: double.infinity,
                    child: Card(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        shape: RoundedRectangleBorder(
                          //<-- SEE HERE
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(
                            color: Colors.orange,
                          ),
                        ),
                        child: Column(
                          children: [

                            Text(
                              user?.name ?? " ",
                              style: TextStyle(
                                  fontFamily: 'Raleway', fontSize: 18),
                            ),
                            Text(user?.collegeName ?? " "),
                            Text(user?.phoneNumber.toString() ?? " "),
                            Text(user?.email ?? " "),
                            Text(user?.type ?? " "),
                            Text(user?.uniqueID ?? " "),

                            //Text("       ALLOWED FOR:  ${user?.passes?[0]?.imageUrl ??" "}               "),
                            //Text("       ALLOWED FOR:  ${user?.passes}               "),
                            //Text("       Events:  ${user?.events?[0]?.event ?? " "}               "),
                            /* ListView.builder(itemCount: (user?.events)?.length,itemBuilder: (context,index){
                            return Text("       Events:  ${user?.events ?? " "}               ");


                          }),*/
                            /* Builder(
                            builder: (context) {
                              return ListView.builder(
                                itemCount: user?.events?.length ?? 0,
                                itemBuilder: (BuildContext context, int index) {
                                  String eventID = user?.events?[index]?.event ?? " ";
                                  return Container(
                                    height: 50, // You can adjust the height as needed
                                    child: Text("Event ID $index: $eventID"),
                                  );
                                },
                              );
                            }
                          )*/
                            user?.passes?.length == 0 ?  Text(".."):
                            ((user?.passes?[0]?.name.toString())=='Day 1' ||(user?.passes?[0]?.name.toString())=='Day 2' ||(user?.passes?[0]?.name.toString())=='Day 3' ) ? Container(
                                height: 50,
                                width: 350,
                                decoration: BoxDecoration(
                                    color: Color(0xffd5ffb4),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.orange, width: 2)),
                                child: Center(
                                    child: Text(
                                        "       ALLOWED FOR:  ${user?.passes?[0]?.name ?? " "}               ",
                                        style: TextStyle(
                                            color:  Colors.green,

                                            fontFamily: 'Raleway',
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)))) :Text("..")
                          ],
                        )),
                  ),
                ),

                user?.events?.length == 0 || user?.events == null
                    ? Column(
                        children: [
                          Text(
                            "no Events or Passes data",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                          Container(
                              height: 50,
                              width: 350,
                              decoration: BoxDecoration(
                                  color: Colors.redAccent.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.orange, width: 2)),
                              child: Center(
                                  child: Text(
                                      "           NOT ALLOWED               ",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontFamily: 'Raleway',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)))),
                        ],
                      )
                    : Column(
                        children: [
                          Container(
                              height: 50,
                              width: 350,
                              decoration: BoxDecoration(
                                  color: Color(0xffd5ffb4),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.orange, width: 2)),
                              child: Center(
                                  child: Text(
                                      "       ALLOWED FOR:  ${user?.passes?[0]?.name ?? " "}               ",
                                      style: TextStyle(
                                          color:  Colors.green,

                                          fontFamily: 'Raleway',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)))),

                          SizedBox(
                            height: 20,
                          ),
                          Text("PASSES for:-\n"),
                          SizedBox(
                            height: 5,
                          ),
                          Card(
                            child: Stack(
                              children: [
                                Container(
                                    child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text(
                                          passName.toString(),
                                          style: TextStyle(
                                              fontSize: 30,
                                              color:passName =='No Band' ? Colors.black   :  Colors.green,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    width: double.infinity,
                                    height: 180,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color:passName =='No Band' ? Colors.red.shade300   : Color(0xffd5ffb4),
                                        border: Border.all(
                                            color: Colors.orange, width: 1))),
                                InkWell(
                                  child: Container(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Image.network(
                                          user?.passes?[0]?.imageUrl ?? " "),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => attendence(
                                                  user_eventID:
                                                      user?.events?[0]?.event,
                                                  user_userID: user?.uniqueID,
                                                )));
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          //best way for represent the list of event and this can be implement in other things as well
                          //Text("Events details:-"),

                       /*   Card(
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: user?.events?.length ?? 0,
                              itemBuilder: (BuildContext context, int index) {
                                print("index:$index");
                                String eventID =
                                    user?.events?[index]?.event ?? " ";
                                String teamID =
                                    user?.events?[index]?.teamId ?? "";
                                return Column(
                                  children: [
                                    Text("Event ID $index: $eventID"),
                                    Text("Team ID:${teamID} \n")
                                  ],
                                );
                              },
                            ),
                          ),*/
                          /*currentValue == 10
                              ? Text(
                                  "attendance marked",
                                  style: TextStyle(fontSize: 20),
                                )
                              : Text(" marked your attendance"),
*/
                          //best method for slider but i am using with function to rebuilt once i needed
                          /*  GradientSlideToAct(
                        width: 400,
                        dragableIconBackgroundColor: Colors.greenAccent,
                        textStyle: TextStyle(color: Colors.white,fontSize: 15),
                        backgroundColor: Colors.redAccent,
                        onSubmit: (){
                          setState(() {
                            currentValue=10;
                            print(currentValue);
                          });
                        },
                        gradient:  const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0Xff11998E ),
                              Color(0Xff38EF7D),
                            ]
                        ),
                      ),*/

                          InkWell(
                            child: Container(
                                height: 50,
                                width: 350,
                                decoration: BoxDecoration(
                                    color: Color(0xffd5ffb4),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.orange, width: 2)),
                                child: Center(
                                    child: Text("   EVENTS   ",
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontFamily: 'Raleway',
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)))),
                            onTap: () {
                              // Navigator.push(context,MaterialPageRoute(builder: (_)=>eventDetaile(uid: widget.uid,eventId: user?.events?[0]?.event,)));
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          HorizontalSlidableButton(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.width * 0.15,
                            buttonWidth: 80.0,
                            color:rresult==true? Colors.red: Color(0xffd5ffb4),
                            buttonColor: Colors.black,
                            borderRadius: BorderRadius.circular(9.0),
                            dismissible: false,
                            label: Center(
                                child: Text(
                              'Slide',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Remove',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'marked',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            onChanged: (position) {
                              setState(() {
                                if (position == SlidableButtonPosition.end) {
                                  result = "present";
                                  print("end");
                                  setState(() {
                                    rresult = true;
                                  });
                                } else {
                                  result = "absent";
                                  setState(() {
                                    rresult = false;
                                  });
                                }
                                print(rresult);
                              });
                            },
                          ),

                          rresult == true
                              ? Text("attendance is marked")
                              : Text("attendance is removed"),

                          //ElevatedButton(onPressed: (){}, child: child)

/*

                      Slider(value: currentValue,max:10,divisions: 1, onChanged: (newSlider ){setState(() {
                        currentValue= newSlider;
                        print(newSlider);
                      });}),
*/

                          SizedBox(
                            height: 10,
                          ),

                          // Container(height: 50,width:350,decoration: BoxDecoration(color: Colors.indigoAccent.shade200,borderRadius:BorderRadius.circular(10),border: Border.all(color: Colors.orange,width: 2)) ,child:Center(child: Text("       Unmark ATTENDANCE               ",style: TextStyle(color:Colors.white70,fontFamily: 'Raleway',fontSize: 20,fontWeight: FontWeight.bold)))),
                        ],
                      ),

                /*Card(child: ListTile(title:)),
                    Card(child: ListTile(title:)),
                    Card(child: ListTile(title: ,)),
                    Card(child: ListTile(title: )),
                    Card(child: ListTile(title: )),*/
                //Card(child:ListTile(title:Text(user ?.passes ?? " "),)),
                //if(user?.passes!=[])
                //user?.passes?.map((value) {  Card(child: ListTile(title: Text(user?.passes[] ?? " "),)), }).toList()
                /*Card(
                      child: ListView(
                        children: user?.passes?.map((e) {
                          return Container(
                            child: Text(e),
                          );
                        }).toList() ?? [],
                      ),
                    )

*/

                //just waste of time to user the Swipeable button view because gradient_slide_to_Act is more better

                /*  SwipeableButtonView(onFinish: ()async{
                      await  Navigator.push(context,MaterialPageRoute(builder: (_)=>attendence()));




                      setState(() {
                      currentValue=10.0;
                    });}, onWaitingProcess:() {
                      Future.delayed(Duration(seconds: 2), () {
                        setState(() {
                          currentValue=1;
                        });
                      });
                    },activeColor: Colors.deepOrangeAccent.withOpacity(0.8), buttonWidget: Container(child:Icon(Icons.arrow_back_ios_new_rounded)), buttonText:"swip for attendance"),

*/
              ],
            ),
          ),
        )));
  }
}
