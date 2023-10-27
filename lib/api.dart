import 'dart:convert';

import 'package:app3/model/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;



class api extends StatefulWidget {
  const api({super.key});

  @override
  State<api> createState() => _apiState();
}

class _apiState extends State<api> {
  List<Welcome> welcome=[];



  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
            title: Text('EVENTS PAGE'),
            leading:IconButton(color: Colors.black,
                icon: Icon(Icons.arrow_back),
                onPressed: ()=>Navigator.of(context).pop())
        ),
      body: FutureBuilder(
        future: getData(),
        builder: (context,snapshot) {
          if(snapshot.hasData)
            {
              return  ListView.builder(itemCount:welcome.length,
                  itemBuilder: (context,index){
                    return Container(height: 200,color:Colors.white70,child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text("User id:${welcome[index].userId}"),Text("id:${welcome[index].id}"),Text("title:${welcome[index].title}"),Text("body:${welcome[index].body}")],),);
                  });
            }
          else {
            return Center(child: CircularProgressIndicator(),);
          }
        }
      )
    );
    

  }
  Future<List<Welcome>> getData() async{
    final response =await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200) {
      for (Map<String, dynamic> index in data) {
        welcome.add(Welcome.fromJson(index));
      }
      return welcome;

    }
    else{
      return welcome;
    }
  }
  
}
