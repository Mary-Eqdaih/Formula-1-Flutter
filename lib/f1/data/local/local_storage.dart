import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageData {
  static const userEmailKey = 'user_email';
  static const String favsKey = 'favoriteTeams';

  Future<void> saveEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userEmailKey, email);
  }

  Future<String?> getSavedEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(userEmailKey);
  }

  Future<void> clearEmail() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(userEmailKey);
  }



  // Save list of team IDs {list of strings}
  static Future<void> saveFavorites(List<String> ids) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(favsKey, ids);
  }

  // Load list of team IDs {list of strings}
  static Future<List<String>> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(favsKey) ?? [];
  }
}
