class StudentModel {
  List<Students>? students;
  int? totalPages;

  StudentModel({this.students, this.totalPages});

  StudentModel.fromJson(Map<String, dynamic> json) {
    if (json['students'] != null) {
      students = <Students>[];
      json['students'].forEach((v) {
        students!.add(Students.fromJson(v));
      });
    }
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (students != null) {
      data['students'] = students!.map((v) => v.toJson()).toList();
    }
    data['totalPages'] = totalPages;
    return data;
  }
}

class Students {
  String? sId;
  String? studentIdNo;
  String? studentName;
  String? department;
  String? studentSession;
  String? batch;
  int? crhr;
  String? shift;

  Students(
      {this.sId,
        this.studentIdNo,
        this.studentName,
        this.department,
        this.studentSession,
        this.batch,
        this.crhr,
        this.shift});

  Students.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    studentIdNo = json['studentIdNo'];
    studentName = json['studentName'];
    department = json['department'];
    studentSession = json['studentSession'];
    batch = json['batch'];
    crhr = json['crhr'];
    shift = json['shift'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['studentIdNo'] = studentIdNo;
    data['studentName'] = studentName;
    data['department'] = department;
    data['studentSession'] = studentSession;
    data['batch'] = batch;
    data['crhr'] = crhr;
    data['shift'] = shift;
    return data;
  }
}
