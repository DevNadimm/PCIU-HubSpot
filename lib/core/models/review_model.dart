class ReviewModel {
  String? sId;
  String? name;
  String? sid;
  int? rating;
  String? review;
  String? createdAt;

  ReviewModel(
      {this.sId,
        this.name,
        this.sid,
        this.rating,
        this.review,
        this.createdAt});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    sid = json['sid'];

    if (json['rating'] is int) {
      rating = json['rating'];
    } else if (json['rating'] is double) {
      rating = json['rating']?.toInt();
    } else if (json['rating'] is String) {
      rating = int.tryParse(json['rating'] ?? '5') ?? 5;
    }

    review = json['review'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['sid'] = sid;
    data['rating'] = rating;
    data['review'] = review;
    data['createdAt'] = createdAt;
    return data;
  }
}
