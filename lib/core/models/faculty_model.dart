class FacultyModel {
  List<Faculties>? faculties;
  int? totalPages;

  FacultyModel({this.faculties, this.totalPages});

  FacultyModel.fromJson(Map<String, dynamic> json) {
    if (json['faculties'] != null) {
      faculties = <Faculties>[];
      json['faculties'].forEach((v) {
        faculties!.add(Faculties.fromJson(v));
      });
    }
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (faculties != null) {
      data['faculties'] = faculties!.map((v) => v.toJson()).toList();
    }
    data['totalPages'] = totalPages;
    return data;
  }
}

class Faculties {
  String? sId;
  String? name;
  String? designation;
  String? sform;
  String? room;
  String? department;
  String? contact;

  Faculties(
      {this.sId,
        this.name,
        this.designation,
        this.sform,
        this.room,
        this.department,
        this.contact});

  Faculties.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    designation = json['designation'];
    sform = json['sform'];
    room = json['room'];
    department = json['department'];
    contact = json['contact'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['designation'] = designation;
    data['sform'] = sform;
    data['room'] = room;
    data['department'] = department;
    data['contact'] = contact;
    return data;
  }
}
