class RegisterRequest {
  final String name;
  final String email;
  final String password;

  final String phone;
  final String type;
  final String? typeId;
  final int governorateId;
  final int cityId;
  final double? lat;
  final double? long;

  RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.type,
    this.typeId,
    required this.governorateId,
    required this.cityId,
    this.lat,
    this.long,
  });
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'type': type,
      'type_id': typeId,
      'governorate_id': governorateId,
      'city_id': cityId,
      'lat': lat,
      'long': long,
    };
  }
}
