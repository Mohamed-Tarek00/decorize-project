import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/authantication/data/models/governorate_model.dart';
import 'package:decorize_project/features/authantication/domain/entities/governorate.dart';
import 'package:decorize_project/features/authantication/domain/repositories/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final ApiService apiService;

  LocationRepositoryImpl(this.apiService);

  @override
  Future<Either<Failure, List<Governorate>>> getGovernorates() async {
    try {
      final data = await apiService.get(endPoint: 'auth/get-governorates');

      final list = data['data'] as List;
      final governorateModels = list
          .map((item) => GovernorateModel.fromJson(item))
          .toList();

      final List<Governorate> entities = governorateModels
          .map((item) => item.toEntity())
          .toList();

      return right(entities);
    } on DioException catch (e) {
      return left(ServiceFailure.fromDio(e));
    } catch (e) {
      return left(ServiceFailure(e.toString()));
    }
  }
}
