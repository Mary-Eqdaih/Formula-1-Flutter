import 'package:flutter/cupertino.dart';
import 'package:formula1_fantasy/f1/data/models/teams_model.dart';
import 'package:formula1_fantasy/f1/data/remote/teams_api.dart';

class F1Provider extends ChangeNotifier {
List<TeamsModel> teams=[];
List<TeamsModel> favs=[];

addToFavorites(TeamsModel team){
  favs.add(team);
  notifyListeners();
}

removeFromFavorites(TeamsModel team){
  favs.remove(team);
  notifyListeners();
}


fetchTeams() async {
  teams = await TeamsApi().fetchData();

}

}