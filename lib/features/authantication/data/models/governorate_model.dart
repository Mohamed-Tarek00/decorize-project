import 'package:decorize_project/features/authantication/domain/entities/governorate.dart';

class GovernorateModel {
  final int id;
  final String nameAr;
  final String nameEn;

  GovernorateModel({
    required this.id,
    required this.nameAr,
    required this.nameEn,
  });

  factory GovernorateModel.fromJson(Map<String, dynamic> json) {
    return GovernorateModel(
      id: json['id'],
      nameAr: json['multi_name']['ar'],
      nameEn: json['multi_name']['en'],
    );
  }

  Governorate toEntity() {
    return Governorate(id: id, nameAr: nameAr, nameEn: nameEn);
  }
}
