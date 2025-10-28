class DriverModel {
  final String driverId;
  final String name;
  final String givenName;
  final String familyName;
  final String nationality;
  final String dateOfBirth;
  final String? permanentNumber;
  final String? code;
  final String? url;

  DriverModel({
    required this.driverId,
    required this.name,
    required this.givenName,
    required this.familyName,
    required this.nationality,
    required this.dateOfBirth,
    this.permanentNumber,
    this.code,
    this.url,
  });

  factory DriverModel.fromJson(Map<String, dynamic> json) {
    final fullName =
    "${json['givenName'] ?? ''} ${json['familyName'] ?? ''}".trim();

    return DriverModel(
      driverId: json["driverId"] ?? '',
      name: fullName,
      givenName: json["givenName"] ?? '',
      familyName: json["familyName"] ?? '',
      nationality: json["nationality"] ?? '',
      dateOfBirth: json["dateOfBirth"] ?? '',
      permanentNumber: json["permanentNumber"],
      code: json["code"],
      url: json["url"],
    );
  }
}
