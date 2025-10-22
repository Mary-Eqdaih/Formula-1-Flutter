import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageData {
  static const userEmailKey = 'user_email';

  Future<void> saveEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userEmailKey, email);
  }

  Future<String?> getSavedEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(userEmailKey);
  }
}