import 'package:decorize_project/features/shared/auth/domain/entities/register_request.dart';

class RegisterRequestModel {
  final RegisterRequest entity;
  RegisterRequestModel({required this.entity});
  Map<String, dynamic> toJson() {
    final data = {
      'name': entity.name,
      'email': entity.email,
      'password': entity.password,
      'password_confirmation': entity.password,
      'phone': entity.phone,
      'type': entity.type,
      'governorate_id': entity.governorateId,
      'city_id': entity.cityId,
      'lat': entity.lat,
      'long': entity.long,
    };
    if (entity.type == 'worker' && entity.typeId != null) {
      data['type_id'] =
          entity.typeId; //هنا لو اختار  عامل هنضيف لل للفايل  تايب اي دي
    }

    return data;
  }
}
