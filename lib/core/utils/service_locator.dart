import 'package:decorize_project/core/router/app_router.dart';
import 'package:decorize_project/core/router/app_router_names.dart';
import 'package:decorize_project/core/utils/api_service.dart';
import 'package:decorize_project/core/utils/cache_helper.dart';
import 'package:decorize_project/features/shared/auth/data/data_source/auth_data_source.dart';
import 'package:decorize_project/features/shared/auth/data/data_source/auth_data_source_impl.dart';
import 'package:decorize_project/features/shared/auth/data/data_source/send_otp_data_source.dart';
import 'package:decorize_project/features/shared/auth/data/data_source/send_otp_data_source_impl.dart';
import 'package:decorize_project/features/shared/auth/data/data_source/static_data_source.dart';
import 'package:decorize_project/features/shared/auth/data/data_source/static_data_source_impl.dart';
import 'package:decorize_project/features/shared/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:decorize_project/features/shared/auth/data/repo_impl/otp_repo_impl.dart';
import 'package:decorize_project/features/shared/auth/data/repo_impl/static_repo_impl.dart';
import 'package:decorize_project/features/shared/auth/domain/repositories/auth_repo.dart';
import 'package:decorize_project/features/shared/auth/domain/repositories/otp_repo.dart';
import 'package:decorize_project/features/shared/auth/domain/usecases/get_cities_use_case.dart';
import 'package:decorize_project/features/shared/auth/domain/usecases/get_governorates_use_case.dart';
import 'package:decorize_project/features/shared/auth/domain/usecases/get_jobs_use_case.dart';
import 'package:decorize_project/features/shared/auth/domain/usecases/otp_verification_use_case.dart';
import 'package:decorize_project/features/shared/auth/domain/usecases/register_use_case.dart';
import 'package:decorize_project/features/shared/auth/domain/repositories/static_repo.dart';
import 'package:decorize_project/features/shared/auth/domain/usecases/forget_password_usecase.dart';
import 'package:decorize_project/features/shared/auth/domain/usecases/login_usecase.dart';
import 'package:decorize_project/features/shared/splash/data/data_source/splash_remote_data_source.dart';
import 'package:decorize_project/features/shared/splash/data/data_source/splash_remote_data_source_impl.dart';
import 'package:decorize_project/features/shared/splash/data/repo_impl/splash_repo_impl.dart';
import 'package:decorize_project/features/shared/splash/domain/repo/splash_repo.dart';
import 'package:decorize_project/features/shared/splash/domain/use_cases/check_token_usecase.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
Future<void> setupServiceLocator() async {
  // cache locator
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => prefs);
  getIt.registerLazySingleton<CacheHelper>(
    () => CacheHelper(getIt<SharedPreferences>()),
  );
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
  getIt.registerLazySingleton<Dio>(() => dio);

  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));

  getIt.registerLazySingleton<SplashRemoteDataSource>(
    () => SplashRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerLazySingleton<SplashRepo>(
    () => SplashRepoImpl(getIt<CacheHelper>(), getIt<SplashRemoteDataSource>()),
  );
  getIt.registerLazySingleton<CheckTokenUsecase>(
    () => CheckTokenUsecase(getIt<SplashRepo>()),
  );

  getIt.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<StaticDataSource>(
    () => StaticDataSourceImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<SendOtpDataSource>(
    () => SendOtpDataSourceImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(authDataSource: getIt<AuthDataSource>()),
  );
  getIt.registerLazySingleton<StaticRepo>(
    () => StaticRepoImpl(staticDataSource: getIt<StaticDataSource>()),
  );
  getIt.registerLazySingleton<OtpRepo>(
    () => OtpRepoImpl(sendOtpDataSource: getIt<SendOtpDataSource>()),
  );

  getIt.registerLazySingleton<GetGovernoratesUseCase>(
    () => GetGovernoratesUseCase(getIt<StaticRepo>()),
  );

  getIt.registerLazySingleton<GetCitiesUseCase>(
    () => GetCitiesUseCase(getIt<StaticRepo>()),
  );

  getIt.registerLazySingleton<GetJobsUseCase>(
    () => GetJobsUseCase(getIt<StaticRepo>()),
  );

  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<OtpVerificationUseCase>(
    () => OtpVerificationUseCase(getIt<OtpRepo>()),
  );

  getIt.registerLazySingleton<LoginUsecase>(
    () => LoginUsecase(authRepo: getIt.get<AuthRepo>()),
  );
  getIt.registerLazySingleton<ForgetPasswordUsecase>(
    () => ForgetPasswordUsecase(staticRepo: getIt.get<AuthRepo>()),
  );
}
