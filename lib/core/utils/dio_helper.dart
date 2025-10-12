import 'package:decorize_project/core/router/app_router.dart';
import 'package:decorize_project/core/router/app_router_names.dart';
import 'package:decorize_project/core/utils/api_service.dart';
import 'package:decorize_project/core/utils/cache_helper.dart';
import 'package:decorize_project/core/utils/service_locator.dart';
import 'package:decorize_project/features/shared/log_out_stream.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';

class DioHelper {
  DioHelper() ;
   Dio createDio(){
  
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiService.baseUrl,
      validateStatus: (status) => status != null && status < 400,
      headers: {
        'Accept': 'application/json',
        'Accept-Language': 'ar',
        'Content-Type': 'application/json',
      },
    ),
  );

  dio.interceptors.add(
    LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
    ),
  );
tokenInterceptor(dio);

return dio ;

  }
 void tokenInterceptor(Dio dio,){
    dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await getIt<CacheHelper>().getToken();
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
      onError: (err, handler) async {
        if (err.response?.statusCode == 401 ||
            err.response?.statusCode == 403) {
              // Logout_Stream 
          getIt<LogoutStream>().addEvent('logout');
          await getIt<CacheHelper>().clearUserData();

          final context = routerKey.currentContext;
          if (context != null && context.mounted) {
            context.go(AppRouterNames.loginView);
          }
        }
        handler.next(err);
      },
    ),
  );
 }
}