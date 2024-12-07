class BatchCoordinatorModel {
  List<BatchCoordinator>? batchCoordinator;
  int? totalPages;

  BatchCoordinatorModel({this.batchCoordinator, this.totalPages});

  BatchCoordinatorModel.fromJson(Map<String, dynamic> json) {
    if (json['batchcoordinator'] != null) {
      batchCoordinator = <BatchCoordinator>[];
      json['batchcoordinator'].forEach((v) {
        batchCoordinator!.add(BatchCoordinator.fromJson(v));
      });
    }
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (batchCoordinator != null) {
      data['batchcoordinator'] =
          batchCoordinator!.map((v) => v.toJson()).toList();
    }
    data['totalPages'] = totalPages;
    return data;
  }
}

class BatchCoordinator {
  String? sId;
  String? name;
  String? sform;
  String? room;
  String? department;
  String? contact;
  List<String>? batch;

  BatchCoordinator(
      {this.sId,
        this.name,
        this.sform,
        this.room,
        this.department,
        this.contact,
        this.batch});

  BatchCoordinator.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    sform = json['sform'];
    room = json['room'];
    department = json['department'];
    contact = json['contact'];
    batch = json['batch'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['sform'] = sform;
    data['room'] = room;
    data['department'] = department;
    data['contact'] = contact;
    data['batch'] = batch;
    return data;
  }
}
