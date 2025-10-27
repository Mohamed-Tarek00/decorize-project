import 'package:decorize_project/features/worker/home/domain/entites/job_city_entity.dart';

class JobCityModel {
  final int id;
  final String name;
  final JobMultiName? multiName;

  JobCityModel({required this.id, required this.name, this.multiName});

  factory JobCityModel.fromJson(Map<String, dynamic> json) {
    return JobCityModel(
      id: json['id'],
      name: json['name'],
      multiName: json['multi_name'] != null
          ? JobMultiName(
              ar: json['multi_name']['ar'],
              en: json['multi_name']['en'],
            )
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'multi_name': multiName != null
          ? {'ar': multiName!.ar, 'en': multiName!.en}
          : null,
    };
  }

  JobCityEntity toEntity() {
    return JobCityEntity(id: id, name: name, multiName: multiName);
  }

  factory JobCityModel.fromEntity(JobCityEntity entity) {
    return JobCityModel(
      id: entity.id,
      name: entity.name,
      multiName: entity.multiName,
    );
  }
}
