class RaceInfoModel {
  final String title;
  final String circuit;
  final String date;
  final String location;
  final String? winner;
  final String? team;

  RaceInfoModel({
    required this.title,
    required this.circuit,
    required this.date,
    required this.location,
    this.winner,
    this.team,
  });
}
