import 'package:decorize_project/core/utils/api_service.dart';
import 'package:decorize_project/features/authantication/data/data_source/location_remote_data_source.dart';
import 'package:decorize_project/features/authantication/data/data_source/location_remote_data_source_Impl.dart';
import 'package:decorize_project/features/authantication/data/models/location_repository_impl.dart';
import 'package:decorize_project/features/authantication/domain/repositories/location_repository.dart';
import 'package:decorize_project/features/authantication/domain/usecases/get_governorates_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<Dio>(() => Dio());

  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));

  getIt.registerLazySingleton<LocationRemoteDataSource>(
    () => LocationRemoteDataSourceImpl(getIt<ApiService>()),
  );

  getIt.registerLazySingleton<LocationRepository>(
    () => LocationRepositoryImpl(getIt<LocationRemoteDataSource>()),
  );

  getIt.registerLazySingleton<GetGovernoratesUseCase>(
    () => GetGovernoratesUseCase(getIt<LocationRepository>()),
  );
}
