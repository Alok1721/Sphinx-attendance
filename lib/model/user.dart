/*
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
import 'package:app3/model/pass.dart';
import 'package:app3/model/event.dart';



// class Pass {
//   String? id;
//   String? name;
//   String? detail;
//   int? amount;
//   String? imageUrl;
//   List<String?>? eventId;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   int? v;
//
//   Pass({this.id, this.name, this.detail, this.amount, this.imageUrl, this.eventId, this.createdAt, this.updatedAt, this.v});
//
//   Pass.fromJson(Map<String, dynamic> json) {
//     id = json['_id'];
//     name = json['name'];
//     detail = json['detail'];
//     amount = json['amount'];
//     imageUrl = json['imageUrl'];
//     if (json['eventId'] != null) {
//       eventId = [];
//       json['eventId'].forEach((v) {
//         eventId!.add(v);
//       });
//     }
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     v = json['__v'];
//   }
//
// }

class Root {
  String? success;
  List<User?>? users;

  Root({this.success, this.users});

  Root.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['users'] != null) {
      users = <User>[];
      json['users'].forEach((v) {
        users!.add(User.fromJson(v));
      });
    }
  }

}

class User {
  String? id;
  String? password;
  String? email;
  String? type;
  List<Event?>? events;
  bool? isAmbassador;
  bool? isMnit;
  bool? isEmailVerified;
  bool? isMobileNumberVerified;
  List<Pass?>? passes;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  int? phoneNumber;
  String? collegeName;
  String? name;
  String? uniqueID;

  User({this.id, this.password, this.email, this.type, this.events, this.isAmbassador, this.isMnit, this.isEmailVerified, this.isMobileNumberVerified, this.passes, this.createdAt, this.updatedAt, this.v, this.phoneNumber, this.collegeName, this.name, this.uniqueID});

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    password = json['password'];
    email = json['email'];
    type = json['type'];
    if (json['events'] != null) {
      events = <Event>[];
      json['events'].forEach((v) {
        events!.add(Event.fromJson(v));
      });
    }
    isAmbassador = json['isAmbassador'];
    isMnit = json['isMnit'];
    isEmailVerified = json['isEmailVerified'];
    isMobileNumberVerified = json['isMobileNumberVerified'];
    if (json['passes'] != null) {
      passes = <Pass>[];
      json['passes'].forEach((v) {
        passes!.add(Pass.fromJson(v));
      });
    }
    createdAt = DateTime.parse(json['createdAt']);
    updatedAt = DateTime.parse(json['updatedAt']);
    v = json['__v'];
    phoneNumber = json['phoneNumber'];
    collegeName = json['collegeName'];
    name = json['name'];
    uniqueID = json['uniqueID'];
  }

}

