import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:formula1_fantasy/f1/data/models/teams_model.dart';

class TeamsApi {
  static const _url =
      'https://api.jolpi.ca/ergast/f1/current/constructors.json';

  Future<List<TeamsModel>> fetchData() async {
    final response = await http.get(Uri.parse(_url));

    if (response.statusCode != 200) {
      throw Exception('Failed to load teams (${response.statusCode})');
    }

    final data = jsonDecode(response.body);
    final List teamsJson = data['MRData']['ConstructorTable']['Constructors'];  // returns list of maps


    // Convert each map in the list (teamsJson) to a TeamsModel
    final teams = teamsJson.map((map) => TeamsModel.fromJson(map)).toList();

    return teams;  //   teams is List of TeamsModel

  }
}
