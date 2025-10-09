import 'package:decorize_project/core/utils/api_service.dart';
import 'package:decorize_project/features/shared/splash/data/data_source/splash_remote_data_source.dart';

class SplashRemoteDataSourceImpl implements SplashRemoteDataSource {
  final ApiService apiService;

  SplashRemoteDataSourceImpl({required this.apiService});
  @override
  Future<bool> checkTokenValidity() async {
    try {
      await apiService.get(endPoint: 'auth/profile');
      return true;
    } on Exception {
      return false;
    }
  }
}
