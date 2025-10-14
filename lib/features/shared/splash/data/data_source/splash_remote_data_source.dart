import 'package:decorize_project/core/utils/api_service.dart';

abstract class SplashRemoteDataSource {
  Future<bool> checkTokenValidity();
}

class SplashRemoteDataSourceImpl implements SplashRemoteDataSource {
  final ApiService apiService;

  SplashRemoteDataSourceImpl({required this.apiService});
  @override
  Future<bool> checkTokenValidity() async {
    await apiService.get(endPoint: 'auth/profile');
    return true;
    //هنا شيلنا فحص الخطا لو غلط يرجع false لان كده كده الانترسيبتور لو الخطأ 401او 403 هيتدخل اما لو خطا تاني ف هو متهندل ف الريبو
  }
}
