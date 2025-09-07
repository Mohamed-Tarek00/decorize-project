import 'package:decorize_project/features/authantication/domain/entities/register_request.dart';

class RegisterRequestModel {
  final RegisterRequest entity;
  RegisterRequestModel({required this.entity});
  Map<String, dynamic> toJson() {
    return {
      'name': entity.name,
      'email': entity.email,
      'password': entity.password,
      'phone': entity.phone,
      'type': entity.type,
      'type_id': entity.typeId,
      'governorate_id': entity.governorateId,
      'city_id': entity.cityId,
      'lat': entity.lat,
      'long': entity.long,
    };
  }
}
