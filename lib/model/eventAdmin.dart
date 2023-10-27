class User {
  String? id;
  String? imageUrl;

  String? type;

  String? name;
  String? uniqueID;

  User({this.id, this.type, this.imageUrl, this.name, this.uniqueID});

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    type = json['type'];
    name = json['name'];
    uniqueID = json['uniqueID'];
    imageUrl = json['imageUrl']; // Add this line to set the imageUrl property
  }
}
