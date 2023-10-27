class eventsD {
  String? success;
  Event? event;

  eventsD({this.success, this.event});

  eventsD.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    event = json['event'] != null ? new Event.fromJson(json['event']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.event != null) {
      data['event'] = this.event!.toJson();
    }
    return data;
  }
}

class Event {
  String? sId;
  String? name;
  String? description;
  String? rulebook;
  String? category;
  String? from;
  String? time;
  String? location;
  List<String>? coordinators;
  List<String>? attendance;
  Admin? admin;
  String? redirectUrl;
  List<String>? updates;
  int? status;
  bool? ended;
  int? amount;
  bool? freeForMNIT;
  int? minTeamSize;
  int? maxTeamSize;
  String? imageUrl;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Event(
      {this.sId,
      this.name,
      this.description,
      this.rulebook,
      this.category,
      this.from,
      this.time,
      this.location,
      this.coordinators,
      this.attendance,
      this.admin,
      this.redirectUrl,
      this.updates,
      this.status,
      this.ended,
      this.amount,
      this.freeForMNIT,
      this.minTeamSize,
      this.maxTeamSize,
      this.imageUrl,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Event.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    rulebook = json['rulebook'];
    category = json['category'];
    from = json['from'];
    time = json['time'];
    location = json['location'];
    if (json['coordinators'] != null) {
      coordinators = [];
      json['coordinators'].forEach((v) {
        coordinators!.add(v);
      });
    }
    if (json['attendance'] != null) {
      attendance = [];
      json['attendance'].forEach((v) {
        attendance!.add(v);
      });
    }
    admin = json['admin'] != null ? new Admin.fromJson(json['admin']) : null;
    redirectUrl = json['redirectUrl'];
    if (json['updates'] != null) {
      updates = [];
      json['updates'].forEach((v) {
        updates!.add(v);
      });
    }
    status = json['status'];
    ended = json['ended'];
    amount = json['amount'];
    freeForMNIT = json['freeForMNIT'];
    minTeamSize = json['minTeamSize'];
    maxTeamSize = json['maxTeamSize'];
    imageUrl = json['imageUrl'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}

class Admin {
  String? sId;
  String? email;
  String? type;
  List<Events>? events;
  bool? isAmbassador;
  bool? isMnit;
  bool? isEmailVerified;
  bool? isMobileNumberVerified;
  List<Null>? passes;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? phoneNumber;
  String? uniqueID;
  String? collegeName;
  String? name;

  Admin(
      {this.sId,
      this.email,
      this.type,
      this.events,
      this.isAmbassador,
      this.isMnit,
      this.isEmailVerified,
      this.isMobileNumberVerified,
      this.passes,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.phoneNumber,
      this.uniqueID,
      this.collegeName,
      this.name});

  Admin.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    type = json['type'];
    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events!.add(new Events.fromJson(v));
      });
    }
    isAmbassador = json['isAmbassador'];
    isMnit = json['isMnit'];
    isEmailVerified = json['isEmailVerified'];
    isMobileNumberVerified = json['isMobileNumberVerified'];
    if (json['passes'] != null) {
      passes = <Null>[];
      json['passes'].forEach((v) {
        passes!.add(new Null.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    phoneNumber = json['phoneNumber'];
    uniqueID = json['uniqueID'];
    collegeName = json['collegeName'];
    name = json['name'];
  }
}

class Events {
  String? event;
  String? teamId;
  String? sId;

  Events({this.event, this.teamId, this.sId});

  Events.fromJson(Map<String, dynamic> json) {
    event = json['event'];
    teamId = json['teamId'];
    sId = json['_id'];
  }
}
