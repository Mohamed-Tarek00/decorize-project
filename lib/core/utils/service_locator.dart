import 'package:decorize_project/core/utils/api_service.dart';
import 'package:decorize_project/core/utils/cache_helper.dart';
import 'package:decorize_project/features/shared/auth/data/data_source/remote_data_source.dart';
import 'package:decorize_project/features/shared/auth/data/data_source/remote_data_source_Impl.dart';
import 'package:decorize_project/features/shared/auth/data/repo_impl/repository_impl.dart';
import 'package:decorize_project/features/shared/auth/domain/repositories/Repo_Interface.dart';
import 'package:decorize_project/features/shared/auth/domain/usecases/get_cities_use_case.dart';
import 'package:decorize_project/features/shared/auth/domain/usecases/get_governorates_use_case.dart';
import 'package:decorize_project/features/shared/auth/domain/usecases/get_jobs_use_case.dart';
import 'package:decorize_project/features/shared/auth/domain/usecases/otp_verification_use_case.dart';
import 'package:decorize_project/features/shared/auth/domain/usecases/register_use_case.dart';
import 'package:decorize_project/features/shared/log/data/data_soerce/login_remote_data_source.dart';
import 'package:decorize_project/features/shared/log/data/data_soerce/login_remote_data_source_impl.dart';
import 'package:decorize_project/features/shared/log/data/repo_impl/login_repo_impl.dart';
import 'package:decorize_project/features/shared/log/domain/repos/login_repo.dart';
import 'package:decorize_project/features/shared/log/domain/use_cases/forget_password_usecase.dart';
import 'package:decorize_project/features/shared/log/domain/use_cases/login_usecase.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
void setupServiceLocator() async {
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

  getIt.registerLazySingleton<Dio>(() => dio);

  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));

  getIt.registerLazySingleton<RemoteDataSource>(
    () => LocationRemoteDataSourceImpl(getIt<ApiService>()),
  );

  getIt.registerLazySingleton<Repositoryinterface>(
    () => RepositoryImpl(getIt<RemoteDataSource>()),
  );

  getIt.registerLazySingleton<GetGovernoratesUseCase>(
    () => GetGovernoratesUseCase(getIt<Repositoryinterface>()),
  );

  getIt.registerLazySingleton<GetCitiesUseCase>(
    () => GetCitiesUseCase(getIt<Repositoryinterface>()),
  );

  getIt.registerLazySingleton<GetJobsUseCase>(
    () => GetJobsUseCase(getIt<Repositoryinterface>()),
  );

  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(getIt<Repositoryinterface>()),
  );
  getIt.registerLazySingleton<OtpVerificationUseCase>(
    () => OtpVerificationUseCase(getIt<Repositoryinterface>()),
  );
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => prefs);
  getIt.registerLazySingleton<CacheHelper>(
    () => CacheHelper(getIt<SharedPreferences>()),
  );

  getIt.registerLazySingleton<LoginRemoteDataSource>(
    () => LoginRemoteDataSourceImpl(apiService: getIt.get<ApiService>()),
  );

  getIt.registerLazySingleton<LoginRepository>(
    () => LoginRepoImpl(remoteDataSource: getIt.get<LoginRemoteDataSource>()),
  );

  getIt.registerLazySingleton<LoginUsecase>(
    () => LoginUsecase(repository: getIt.get<LoginRepository>()),
  );
  getIt.registerLazySingleton<ForgetPasswordUsecase>(
    () => ForgetPasswordUsecase(repository: getIt.get<LoginRepository>()),
  );
}
