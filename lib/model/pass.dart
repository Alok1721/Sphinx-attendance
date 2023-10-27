// class Passes {
//   List<Pass>? pass;
//
//   Passes({this.pass});
//
//   Passes.fromJson(Map<String, dynamic> json) {
//     if (json['passes'] != null) {
//       pass = <Pass>[];
//       json['passes'].forEach((v) {
//         pass!.add(new Pass.fromJson(v));
//       });
//     }
//   }
//
//
// }

class Pass {
  String? sId;
  String? name;
  String? detail;
  int? amount;
  String? imageUrl;
  List<String>? eventId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? iV;

  Pass(
      {this.sId,
        this.name,
        this.detail,
        this.amount,
        this.imageUrl,
        this.eventId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Pass.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    detail = json['detail'];
    amount = json['amount'];
    imageUrl = json['imageUrl'];
    eventId = json['eventId'].cast<String>();
    createdAt = DateTime.parse(json['createdAt']);
    updatedAt = DateTime.parse(json['updatedAt']);
    iV = json['__v'];
  }


}