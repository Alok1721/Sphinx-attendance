

class Event {
  String? event;
  String? teamId;
  String? id;

  Event({this.event, this.teamId, this.id});

  Event.fromJson(Map<String, dynamic> json) {
    event = json['event'];
    teamId = json['teamId'];
    id = json['_id'];
  }

}

class Root {
  List<Event?>? events;

  Root({this.events});

  Root.fromJson(Map<String, dynamic> json) {
    if (json['events'] != null) {
      events = <Event>[];
      json['events'].forEach((v) {
        events!.add(Event.fromJson(v));
      });
    }
  }

}
