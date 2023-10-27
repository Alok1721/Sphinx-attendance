import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'model/user.dart';
import 'model/attend.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:gradient_slide_to_act/gradient_slide_to_act.dart';
import 'package:slidable_button/slidable_button.dart';

class attendence extends StatefulWidget {
  //const attendence({super.key});
  var user_eventID;
  var user_userID;
  attendence({Key? my,this.user_eventID,this.user_userID}):super(key:my);

  @override
  State<attendence> createState() => _attendenceState();
}

class _attendenceState extends State<attendence> {
  Root? user_attend;
  bool attend=false;
  bool? isCheck=false;
  bool showCheckBox=false;
  bool showAttendance=false;
  double currentValue=1;
  double newslider=1 ;
  var result;
  bool rresult=false;


  @override
  void initState()
  {
    super.initState();
    checkAttendance();
  }

  Future<void> checkAttendance() async{


    var url=Uri.https("sphinx-372511.de.r.appspot.com","/api/events/attend");
    var response= await http.post(url,  headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },

      body: jsonEncode(<String, String>{
        'eventID':widget.user_eventID.toString(),
        'userID':widget.user_eventID.toString(),
      }),) ;
    if(response.statusCode==200)
    {
      print(response.body);
      setState(() {
        attend=true;
        //Text("message is:a${response.body}");

      });



    }
    print("status of attend is:${attend}");


    var data = jsonDecode(response.body);

    setState(() {
      user_attend = Root.fromJson(data);
      showCheckBox=true;

      //pas = User.fromJson(data['users'][0]['passes'][0]);
    });
    print(user_attend?.message ?? " ");


    //print(user);
    // print("response status:${response}");
    // print("response body:${response.body}");
    //child:Text('this is body of api,${response.body}');


  }

  @override
  Widget build(BuildContext context) {




    return Scaffold(
        appBar: AppBar(
            title: Text('ATTENDANCE'),
            leading:IconButton(color: Colors.black,
                icon: Icon(Icons.arrow_back),
                onPressed: ()=>Navigator.of(context).pop()),
          backgroundColor: Colors.orange.shade300,
        ),
        body: Column(
          children: [
            Container(width: double.infinity,height: 200,decoration: BoxDecoration(color: Colors.orangeAccent,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.0),bottomRight: Radius.circular(10.0))),),
            SizedBox(height: 20,),

            /*if(attend==true)
              {return Text("attendance is marked")},*/
            //Text("${}"),
            attend==true? Text("attendance is marked"):Text("not present"),
            Text(user_attend?.message.toString() ?? "not present ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            showCheckBox==true? CheckboxListTile(title:Text("Your attendance"),subtitle: Text("already marked"),   value: attend, activeColor: Colors.green,  onChanged: (bool? newValue ){
              setState(() {

              });
            }): Text(" "),


            SizedBox(height: 40,),
            ElevatedButton(onPressed: (){  setState(() {showAttendance=true;


            });  },style: ElevatedButton.styleFrom(primary: Colors.orange.shade600 ), child: Text("Mark your attendence")),

           /* Slider(value: currentValue,max:10,divisions: 2, onChanged: (newSlider ){setState(() {
              currentValue= newSlider;
              print(newSlider);
            });}),
            SwipeableButtonView(onFinish: ()async{setState(() {
              currentValue=10.0;
            });}, onWaitingProcess:() {
              Future.delayed(Duration(seconds: 2), () {
                setState(() {
                  currentValue=1;
                });
              });
            },activeColor: Colors.red, buttonWidget: Container(child:Icon(Icons.arrow_back_ios_new_rounded)), buttonText:"swip for attendance"),

 */




            showAttendance==true ? GradientSlideToAct(
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
            ):Text("--------------------  "),
            //isCheck==true?  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("att "))) : Text(" "),

            HorizontalSlidableButton(
              width: MediaQuery.of(context).size.width *0.8,
              height: MediaQuery.of(context).size.width*0.15,
              buttonWidth: 80.0,
              color: Colors.orangeAccent.shade200,
              buttonColor: Colors.black,borderRadius:BorderRadius.circular(9.0) ,
              dismissible: false,
              label: Center(child: Text('Slide',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)),

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Remove',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                    Text('marked',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              onChanged: (position) {
                setState(() {
                  if (position == SlidableButtonPosition.end) {
                    result = "present";
                    print("end");
                    setState(() {
                      rresult=true;
                    });

                  } else {
                    result = "absent";
                    setState(() {
                      rresult=false;

                    });


                  }
                  print(rresult);
                });
              },
            ),

            rresult==true? Text("attendance is marked"):Text("attendance is removed"),




          ],
        ),








    );
  }
}
