import 'package:decorize_project/features/shared/auth/domain/entities/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  final SharedPreferences _prefs;
  CacheHelper(this._prefs);

  Future<void> saveToken({required String token}) async {
    await _prefs.setString('token', token);
  }

  Future<void> saveUserData({required UserEntity user}) async {
    await _prefs.setInt('id', user.id);
    await _prefs.setString('type', user.type);
    await _prefs.setString('name', user.name);
    await _prefs.setString('email', user.email);
    await _prefs.setString('phone', user.phone);
    await _prefs.setString('image', user.image);
    await _prefs.setBool('is_verified', user.isVerified);
  }

  Future<String?> getToken() async {
    return _prefs.getString('token');
  }

  Future<String?> getUserType() async {
    return _prefs.getString('type');
  }

  Future<UserEntity?> getUserProfile() async {
    final id = _prefs.getInt('id');
    final type = _prefs.getString('type');
    final name = _prefs.getString('name');
    final email = _prefs.getString('email');
    final phone = _prefs.getString('phone');
    final image = _prefs.getString('image');
    final isVerified = _prefs.getBool('is_verified');

    if (id != null &&
        type != null &&
        name != null &&
        email != null &&
        phone != null &&
        image != null &&
        isVerified != null) {
      return UserEntity(
        id: id,
        type: type,
        name: name,
        email: email,
        phone: phone,
        image: image,
        isVerified: isVerified,
      );
    }
    return null;
  }

  Future<void> clearUserData() async {
    await _prefs.clear();
  }
}
