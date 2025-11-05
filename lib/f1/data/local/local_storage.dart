import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageData {
  // static const userEmailKey = 'user_email';
  static const String favsKey = 'favoriteTeams';
  // static const String userNameKey = 'userName';

  // // User Name
  // Future<void> saveEmail(String email) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString(userEmailKey, email);
  // }
  //
  // Future<String?> getSavedEmail() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return prefs.getString(userEmailKey);
  // }
  //
  // Future<void> saveUsername(String userName) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString(userNameKey, userName);
  // }
  //
  // Future<String?> getSUsername() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return prefs.getString(userNameKey);
  // }
  //
  // Future<void> clearEmail() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.remove(userEmailKey);
  // }
  // Future<void> clearUsername() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.remove(userNameKey);
  // }
  //////////////////////////////////////////////////////////////////////////////

  // Favorites

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
