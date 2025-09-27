import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  final SharedPreferences _prefs;
  CacheHelper(this._prefs);

  Future<void> saveUserData({
    required String token,
    required String type,
    required String name,
    required String email,
    required String phone,
    required String image,
  }) async {
    final _prefs = await SharedPreferences.getInstance();
    await _prefs.setString('token', token);
    await _prefs.setString('type', type);
    await _prefs.setString('name', name);
    await _prefs.setString('email', email);
    await _prefs.setString('phone', phone);
    await _prefs.setString('image', image);
  }

  Future<String?> getToken() async {
    final _prefs = await SharedPreferences.getInstance();
    return _prefs.getString('token');
  }

  Future<String?> getUserType() async {
    final _prefs = await SharedPreferences.getInstance();
    return _prefs.getString('type');
  }

  Future<Map<String, String?>> getUserProfile() async {
    final _prefs = await SharedPreferences.getInstance();
    return {
      'name': _prefs.getString('name'),
      'email': _prefs.getString('email'),
      'phone': _prefs.getString('phone'),
      'image': _prefs.getString('image'),
    };
  }

  Future<void> clearUserData() async {
    final _prefs = await SharedPreferences.getInstance();
    await _prefs.clear();
  }
}
