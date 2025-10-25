import 'package:decorize_project/core/utils/api_service.dart';
import 'package:decorize_project/features/shared/auth/data/models/user_model.dart';
import 'package:decorize_project/features/user/more/data/models/edit_password_model.dart';
import 'package:decorize_project/features/user/more/data/models/edit_profile_model.dart';

abstract class MoreDataSource {
  Future<Map<String, dynamic>> editPassword({required EditPasswordModel model});
  Future<UserModel> editProfile({required EditProfileModel model});
}

class MoreDataSourceImpl implements MoreDataSource {
  final ApiService _apiService;

  MoreDataSourceImpl(this._apiService);

  @override
  Future<Map<String, dynamic>> editPassword({
    required EditPasswordModel model,
  }) async {
    final response = await _apiService.post(
      endPoint: 'auth/chang-password',
      data: model.toJson(),
    );
    return response;
  }

  @override
  Future<UserModel> editProfile({required EditProfileModel model}) async {
    final response = await _apiService.post(
      endPoint: '/auth/update-profile',
      data: model.toJson(),
    );
    final userJson = response['data']['user'];

    final UserModel responseModel = UserModel.fromJson(userJson);
    return responseModel;
  }
}
