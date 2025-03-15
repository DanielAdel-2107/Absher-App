class OpinionsModel {
  String? name;
  String? opinion;
  String? rating;
  OpinionsModel({this.name, this.opinion, this.rating});

  OpinionsModel.fromJson(Map<String, dynamic> json) {
    name = json['user_name'];
    opinion = json['user_feedback'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_name'] = name;
    data['user_feedback'] = opinion;
    return data;
  }

  @override
  String toString() {
    return ('OpinionsModel{name: $name, opinion: $opinion, rating: $rating}');
  }
}
