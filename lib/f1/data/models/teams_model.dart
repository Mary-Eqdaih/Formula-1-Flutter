class TeamsModel {
  final String teamName;
  final String nationality;
  final String logo;
  final String constructorId;

  TeamsModel({
    required this.teamName,
    required this.nationality,
    required this.logo,
    required this.constructorId,
  });

  factory TeamsModel.fromJson(Map<String, dynamic> json) {
    final name = json['name'] ?? '';

    // 🏁 Map API team names to your asset file names
    const logos = {
      'Mercedes': 'assets/images/Mercedes.svg',
      'Red Bull': 'assets/images/redbull.png',
      'Ferrari': 'assets/images/ferrari.svg',
      'McLaren': 'assets/images/mclaren.svg',
      'Aston Martin': 'assets/images/Aston_Martin.png',
      'Alpine F1 Team': 'assets/images/alpine.png',
      'Williams': 'assets/images/williams.svg',
      'Haas F1 Team': 'assets/images/haas.svg',
      'RB F1 Team': 'assets/images/RB.svg',
      'Sauber': 'assets/images/Kick Sauber.png',
    };

    return TeamsModel(
      constructorId: json["constructorId"],
      teamName: name,
      nationality: json['nationality'] ?? '',
      logo: logos[name] ?? 'assets/images/F1_logo.svg', // fallback if missing
    );
  }
}
//takes a map and returns TeamModel