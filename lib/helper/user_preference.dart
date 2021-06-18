import 'package:shared_preferences/shared_preferences.dart';

class UserPreference{
  static SharedPreferences preferences;
  String sessionName="user_crendential";

  ///fungsi untuk menyimpan user session untuk nama email dan token untuk request api
  static Future<void> setCredentialUser(Map<String,dynamic>data) async {
    preferences = await SharedPreferences.getInstance();
    preferences.setString("token", data["token"]);
    preferences.setString("email", data["email"]);
    preferences.setString("name", data["name"]);
    preferences.setString("id", data["id"]);
  }


  static Future<void> deleteCredentiallUser() async {
    preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }
  //fungsi uuntuk mendapatkan user session dalam bentuk data map
  static Future<Map<String,dynamic>> getCredentialUser() async {
    preferences = await SharedPreferences.getInstance();
    Map<String,dynamic> userCredential={
      "id": preferences.getString("id"),
      "token": preferences.getString("token"),
      "name":  preferences.getString("name"),
      "email":preferences.getString("email"),
    };
    return userCredential;
  }

}