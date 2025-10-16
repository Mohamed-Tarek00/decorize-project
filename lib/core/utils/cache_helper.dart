import 'package:decorize_project/features/shared/auth/domain/entities/auth_response_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  final SharedPreferences _prefs;
  CacheHelper(this._prefs);

  Future<void> saveToken({required String token}) async {
    await _prefs.setString('token', token);
  }

  Future<void> saveUserData({required AuthResponseEntity authResponse}) async {
    await _prefs.setString('type', authResponse.user.type);
    await _prefs.setString('name', authResponse.user.name);
    await _prefs.setString('email', authResponse.user.email);
    await _prefs.setString('phone', authResponse.user.phone);
    await _prefs.setString('image', authResponse.user.image);
  }

  Future<String?> getToken() async {
    return _prefs.getString('token');
  }

  Future<String?> getUserType() async {
    return _prefs.getString('type');
  }

  Future<Map<String, String?>> getUserProfile() async {
    return {
      'name': _prefs.getString('name'),
      'email': _prefs.getString('email'),
      'phone': _prefs.getString('phone'),
      'image': _prefs.getString('image'),
    };
  }

  Future<void> clearUserData() async {
    await _prefs.clear();
  }
}
