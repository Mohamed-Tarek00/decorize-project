import 'package:decorize_project/features/shared/auth/domain/entities/city.dart';

class CityModel {
  int id;
  String nameAr;
  String nameEn;
  CityModel({required this.id, required this.nameAr, required this.nameEn});
  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'],
      nameAr: json['multi_name']['ar'],
      nameEn: json['multi_name']['en'],
    );
  }
  City toEntity() {
    return City(id: id, nameAr: nameAr, nameEn: nameEn);
  }
}
