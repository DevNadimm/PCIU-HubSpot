class EventModel {
  final String? id;
  final String? name;
  final String? sid;
  final String? department;
  final String? topic;
  final String? date;
  final String? time;
  final String? description;
  final String? location;
  final int? fee;
  final String? banner;
  final String? club;

  EventModel({
    this.id,
    this.name,
    this.sid,
    this.department,
    this.topic,
    this.date,
    this.time,
    this.description,
    this.location,
    this.fee,
    this.banner,
    this.club,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['_id'],
      name: json['name'],
      sid: json['sid'],
      department: json['eDepartment'],
      topic: json['eventTopic'],
      date: json['eDate'],
      time: json['eTime'],
      description: json['eDescription'],
      location: json['eLocation'],
      fee: json['eFee'],
      banner: json['eBanner'],
      club: json['eClub'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'sid': sid,
      'eDepartment': department,
      'eventTopic': topic,
      'eDate': date,
      'eTime': time,
      'eDescription': description,
      'eLocation': location,
      'eFee': fee,
      'eBanner': banner,
      'eClub': club,
    };
  }

  @override
  String toString() {
    return 'EventModel(id: $id, name: $name, topic: $topic, date: $date)';
  }
}
