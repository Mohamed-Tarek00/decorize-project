import 'package:decorize_project/core/utils/api_service.dart';
import 'package:decorize_project/features/authantication/data/data_source/remote_data_source.dart';
import 'package:decorize_project/features/authantication/data/data_source/remote_data_source_Impl.dart';
import 'package:decorize_project/features/authantication/data/repo_impl/repository_impl.dart';
import 'package:decorize_project/features/authantication/domain/repositories/Repo_Interface.dart';
import 'package:decorize_project/features/authantication/domain/usecases/get_cities_use_case.dart';
import 'package:decorize_project/features/authantication/domain/usecases/get_governorates_use_case.dart';
import 'package:decorize_project/features/authantication/domain/usecases/get_jobs_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<Dio>(() => Dio());

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
}
