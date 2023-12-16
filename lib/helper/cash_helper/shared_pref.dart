import 'package:shared_preferences/shared_preferences.dart';
import '../encrypt_helper.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static Future init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static dynamic getData(String key) {
    var data = sharedPreferences.get(key);
    if (data.runtimeType == String) {
      return EncryptionHelper.decryptMessage(data.toString());
    }
    return data;
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is bool) return await sharedPreferences.setBool(key, value);
    if (value is String)
      return await sharedPreferences.setString(
          key, EncryptionHelper.encryptMessage(value));
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is double) return await sharedPreferences.setDouble(key, value);
    print("error in cash_helper>>>>$key is $value");
    return false;
  }

  static Future<bool> removeData({
    required String key,
  }) async {
    return await sharedPreferences.remove(key);
  }

  static void signOut() {
    sharedPreferences.clear();
  }
}
