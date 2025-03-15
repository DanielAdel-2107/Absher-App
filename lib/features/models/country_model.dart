class CountryModel {
  final String region, country;

  CountryModel({required this.region, required this.country});
  factory CountryModel.fromJson(dynamic json) {
    return CountryModel(
      region: json['city'],
      country: json['country'],
    );
  }
  @override
  String toString() {
    // TODO: implement toString
    return {'city': region, 'country': country}.toString();
  }
}
