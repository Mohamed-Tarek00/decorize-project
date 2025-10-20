class UserEntity {
  final int id;
  final String name;
  final String email;
  final String type;
  final String? profession;
  final String phone;
  final int? status;
  final bool isVerified;
  final String image;
  final double? lat;
  final double? long;
  final int? governorateId;
  final int? cityId;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.type,
    this.profession,
    required this.phone,
    this.status,
    required this.isVerified,
    required this.image,
    this.lat,
    this.long,
    this.governorateId,
    this.cityId,
  });
}
