class EventModel {
  late String name;
  String? id;
  String? description;
  DateTime? date;
  late String location;
  late List eventreservation;
  String? eventReason;

  EventModel({
    required this.name,
    this.id,
    this.description,
    this.date,
    required this.location,
    required this.eventreservation,
  });

  EventModel.fromJson(Map<String, dynamic> json) {
    String? dateString =
        json['com_eventdateandtime'] ?? json['com_newsdateandtime'];
    name = json['com_name'] ?? "";
    id = json['com_eventid'] ?? json['com_updateid'];
    description = json['com_description'];
    date = dateString != null ? DateTime.parse(dateString) : null;
    location = json['com_location'] ?? "";
    eventreservation = json['com_com_event_com_eventreservation_Event'] ?? [];
    eventReason = json['com_eventreason'];
  }
}
