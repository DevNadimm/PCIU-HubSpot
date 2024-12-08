class OfficerModel {
  List<Officers>? officers;
  int? totalPages;

  OfficerModel({this.officers, this.totalPages});

  OfficerModel.fromJson(Map<String, dynamic> json) {
    if (json['officers'] != null) {
      officers = <Officers>[];
      json['officers'].forEach((v) {
        officers!.add(Officers.fromJson(v));
      });
    }
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (officers != null) {
      data['officers'] = officers!.map((v) => v.toJson()).toList();
    }
    data['totalPages'] = totalPages;
    return data;
  }
}

class Officers {
  String? sId;
  String? name;
  String? designation;
  String? sector;
  String? contact;

  Officers({this.sId, this.name, this.designation, this.sector, this.contact});

  Officers.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    designation = json['designation'];
    sector = json['sector'];
    contact = json['contact'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['designation'] = designation;
    data['sector'] = sector;
    data['contact'] = contact;
    return data;
  }
}
