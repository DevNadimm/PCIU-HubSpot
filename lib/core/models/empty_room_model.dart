import 'dart:convert';

class EmptyRoomModel {
  final String day;
  final List<String> ctime1;
  final List<String> ctime2;
  final List<String> ctime3;
  final List<String> ctime4;
  final List<String> ctime5;

  EmptyRoomModel({
    required this.day,
    required this.ctime1,
    required this.ctime2,
    required this.ctime3,
    required this.ctime4,
    required this.ctime5,
  });

  List<String> ctime(int index) {
    switch (index) {
      case 1:
        return ctime1;
      case 2:
        return ctime2;
      case 3:
        return ctime3;
      case 4:
        return ctime4;
      case 5:
        return ctime5;
      default:
        return [];
    }
  }

  factory EmptyRoomModel.fromJson(Map<String, dynamic> json) {
    return EmptyRoomModel(
      day: json['day'] as String,
      ctime1: List<String>.from(json['ctime1'] ?? []),
      ctime2: List<String>.from(json['ctime2'] ?? []),
      ctime3: List<String>.from(json['ctime3'] ?? []),
      ctime4: List<String>.from(json['ctime4'] ?? []),
      ctime5: List<String>.from(json['ctime5'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'ctime1': ctime1,
      'ctime2': ctime2,
      'ctime3': ctime3,
      'ctime4': ctime4,
      'ctime5': ctime5,
    };
  }

  static List<EmptyRoomModel> fromJsonList(String jsonString) {
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => EmptyRoomModel.fromJson(json as Map<String, dynamic>)).toList();
  }

  static String toJsonList(List<EmptyRoomModel> list) {
    final List<Map<String, dynamic>> jsonList = list.map((e) => e.toJson()).toList();
    return json.encode(jsonList);
  }
}
