import 'package:flutter/cupertino.dart';
import 'package:formula1_fantasy/f1/data/models/driver_model.dart';
import 'package:formula1_fantasy/f1/data/models/teams_model.dart';
import 'package:formula1_fantasy/f1/data/remote/drivers_api.dart';
import 'package:formula1_fantasy/f1/data/remote/teams_api.dart';

import '../../data/local/local_storage.dart' show LocalStorageData;

class F1Provider extends ChangeNotifier {
  List<TeamsModel> teams = [];
  List<TeamsModel> favs = [];
  final Map<String, List<DriverModel>> driversByTeam = {};

  List<DriverModel> driversFor(String constructorId) {
    return driversByTeam[constructorId] ?? const [];
  }
  Future<void> fetchDriversFor(String constructorId) async {
    // Avoid refetching if already cached
    if (driversByTeam.containsKey(constructorId)) return;
    final fetched = await DriversApi().fetchDrivers(constructorId);
    driversByTeam[constructorId] = fetched;
    notifyListeners();
  }
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
    var fetchedTeams = await TeamsApi().fetchTeams();
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

