import 'package:flutter/cupertino.dart';
import 'package:formula1_fantasy/f1/data/models/teams_model.dart';
import 'package:formula1_fantasy/f1/data/remote/teams_api.dart';

import '../../data/local/local_storage.dart' show LocalStorageData;

class F1Provider extends ChangeNotifier {
  List<TeamsModel> teams = [];
  List<TeamsModel> favs = [];

  void init()async{
   await fetchTeams();
   await loadFavorites();
  }

  addToFavorites(TeamsModel team) {
    favs.add(team);
    saveFavoritesToStorage();
    notifyListeners();
  }

  removeFromFavorites(TeamsModel team) {
    favs.remove(team);
    saveFavoritesToStorage();
    notifyListeners();
  }

  fetchTeams() async {
    var fetchedTeams = await TeamsApi().fetchData();
    teams = fetchedTeams;
    notifyListeners();
  }




  // Save favorites IDs to SharedPreferences
  Future<void> saveFavoritesToStorage() async {
    final ids = favs.map((team) => team.constructorId).toList();
    await LocalStorageData.saveFavorites(ids);
  }

  // Load favorites IDs and rebuild list
  Future<void> loadFavorites() async {
    final savedIds = await LocalStorageData.loadFavorites();
    favs = teams.where((team) => savedIds.contains(team.constructorId)).toList();
    notifyListeners();
  }
}

