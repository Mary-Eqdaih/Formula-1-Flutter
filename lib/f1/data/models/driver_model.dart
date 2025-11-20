class DriverModel {
  final String driverId;
  final String name;
  final String givenName;
  final String familyName;
  final String nationality;
  final String dateOfBirth;
  final String? permanentNumber;
  final String code;
  final String? url;
  final String image;


  DriverModel({
    required this.driverId,
    required this.name,
    required this.givenName,
    required this.familyName,
    required this.nationality,
    required this.dateOfBirth,
    this.permanentNumber,
    required this.code,
    this.url,
    required this.image,

  });

  factory DriverModel.fromJson(Map<String, dynamic> json) {
    final code = json['code'] ?? '';
    final fullName = "${json['givenName'] ?? ''} ${json['familyName'] ?? ''}"
        .trim();
    const photos = {
      'VER': 'assets/images/drivers/max_verstappen.webp',
      'HAM': 'assets/images/drivers/lewis_hamilton.webp',
      'NOR': 'assets/images/drivers/lando_norris.jpeg',
      'LEC': 'assets/images/drivers/charles_leclerc.jpeg',
      'SAI': 'assets/images/drivers/carlos_sainz.jpeg',
      'RUS': 'assets/images/drivers/george_russell.jpeg',
      'ALO': 'assets/images/drivers/fernando_alonso.webp',
      'STR': 'assets/images/drivers/lance_stroll.jpeg',
      'GAS': 'assets/images/drivers/pierre_gasly.jpeg',
      'OCO': 'assets/images/drivers/esteban_ocon.webp',
      'ALB': 'assets/images/drivers/alex_albon.png',
      'HUL': 'assets/images/drivers/nico_hulkenberg.jpeg',
      'PIA': 'assets/images/drivers/oscar_piastri.jpeg',
      'TSU': 'assets/images/drivers/yuki_tsunoda.webp',
      'COL': 'assets/images/drivers/franco_colapinto.jpeg',
      'BEA': 'assets/images/drivers/oliver_bearman.jpeg',
      'ANT': 'assets/images/drivers/kimi_antonelli.webp',
      'LAW': 'assets/images/drivers/liam_lawson.webp',
      'HAD': 'assets/images/drivers/isack_hadjar.webp',
      'BOR': 'assets/images/drivers/gabriel_bortoleto.jpeg',
      'DOO':'assets/images/drivers/jack_doohan.jpeg',
    };
    return DriverModel(
      image: photos[code]??'assets/images/drivers/default.webp',
      driverId: json["driverId"] ?? '',
      name: fullName,
      givenName: json["givenName"] ?? '',
      familyName: json["familyName"] ?? '',
      nationality: json["nationality"] ?? '',
      dateOfBirth: json["dateOfBirth"] ?? '',
      permanentNumber: json["permanentNumber"],
      code: code,
      url: json["url"],
    );
  }
}
