import 'package:decorize_project/features/authantication/data/models/governorate_model.dart';

abstract class LocationRemoteDataSource {
  Future<List<GovernorateModel>> getGovernorates();
}
