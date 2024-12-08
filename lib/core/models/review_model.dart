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
    rating = json['rating'];
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
