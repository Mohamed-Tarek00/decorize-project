import 'package:decorize_project/core/utils/api_service.dart';
import 'package:decorize_project/core/utils/cache_helper.dart';
import 'package:decorize_project/core/utils/dio_helper.dart';
import 'package:decorize_project/core/utils/location_api_service.dart';
import 'package:decorize_project/features/shared/auth/data/data_source/auth_data_source.dart';
import 'package:decorize_project/features/shared/auth/data/data_source/send_otp_data_source.dart';
import 'package:decorize_project/features/shared/auth/data/data_source/static_data_source.dart';
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
import 'package:decorize_project/features/shared/auth/domain/usecases/reset_password_usecase.dart';
import 'package:decorize_project/features/shared/log_out_stream.dart';
import 'package:decorize_project/features/shared/splash/data/data_source/splash_remote_data_source.dart';
import 'package:decorize_project/features/shared/splash/data/repo_impl/splash_repo_impl.dart';
import 'package:decorize_project/features/shared/splash/domain/repo/splash_repo.dart';
import 'package:decorize_project/features/shared/splash/domain/use_cases/check_token_usecase.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
Future<void> setupServiceLocator() async {
  //logout stream
  getIt.registerLazySingleton(() => LogoutStream());
  // cache locator
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => prefs);
  getIt.registerLazySingleton<CacheHelper>(
    () => CacheHelper(getIt<SharedPreferences>()),
  );
  // dio options for main api service
  final dio = DioHelper().createDio();
  getIt.registerLazySingleton<Dio>(() => dio);

  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));
// dio options for location api service
 final dioLocation = Dio(BaseOptions(
    baseUrl: LocationApiService.baseUrl,
     headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
  ));
  getIt.registerLazySingleton<LocationApiService>(() => LocationApiService(dioLocation));
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
  getIt.registerLazySingleton<ResetPasswordUsecase>(
    () => ResetPasswordUsecase(authRepo: getIt.get<AuthRepo>()),
  );
}
