class CRModel {
  List<Crs>? crs;
  int? totalPages;

  CRModel({this.crs, this.totalPages});

  CRModel.fromJson(Map<String, dynamic> json) {
    if (json['crs'] != null) {
      crs = <Crs>[];
      json['crs'].forEach((v) {
        crs!.add(Crs.fromJson(v));
      });
    }
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (crs != null) {
      data['crs'] = crs!.map((v) => v.toJson()).toList();
    }
    data['totalPages'] = totalPages;
    return data;
  }
}

class Crs {
  String? sId;
  dynamic batch;
  String? crname;
  String? phone;
  String? mail;
  String? fbid;
  String? department;
  String? shift;
  String? section;

  Crs({
    this.sId,
    this.batch,
    this.crname,
    this.phone,
    this.mail,
    this.fbid,
    this.department,
    this.shift,
    this.section,
  });

  Crs.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];

    if (json['batch'] is int) {
      batch = json['batch'].toString();
    } else {
      batch = json['batch'];
    }

    crname = json['crname'];
    phone = json['phone'];
    mail = json['mail'];
    fbid = json['fbid'];
    department = json['department'];
    shift = json['shift'];
    section = json['section'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;

    if (batch is int) {
      data['batch'] = batch.toString();
    } else {
      data['batch'] = batch;
    }

    data['crname'] = crname;
    data['phone'] = phone;
    data['mail'] = mail;
    data['fbid'] = fbid;
    data['department'] = department;
    data['shift'] = shift;
    data['section'] = section;
    return data;
  }
}
