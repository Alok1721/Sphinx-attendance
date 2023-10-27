class Root {
  String? message;

  Root({this.message});

  Root.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

}

