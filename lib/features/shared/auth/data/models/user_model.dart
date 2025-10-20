import 'package:decorize_project/features/shared/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.type,
    super.profession,
    required super.phone,
    required super.status,
    required super.isVerified,
    required super.image,
    super.lat,
    super.long,
    super.governorateId,
    super.cityId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      type: json['type'],
      profession: json.containsKey('profession') ? json['profession'] : null,
      phone: json['phone'],
      status: json['status'],
      isVerified: json['is_verified'],
      image: json['image'],
      lat: (json['lat'] != null)
          ? double.tryParse(json['lat'].toString())
          : null,
      long: (json['long'] != null)
          ? double.tryParse(json['long'].toString())
          : null,
      governorateId: json['governorate_id'],
      cityId: json['city_id'],
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      email: email,
      type: type,
      profession: profession,
      phone: phone,
      status: status,
      isVerified: isVerified,
      image: image,
      lat: lat,
      long: long,
      governorateId: governorateId,
      cityId: cityId,
    );
  }
}
