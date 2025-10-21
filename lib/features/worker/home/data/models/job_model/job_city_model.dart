import 'package:decorize_project/features/worker/home/domain/entites/job_city_entity.dart';

class JobCityModel {
  final JobCityEntity entity;

  JobCityModel({required this.entity});

  factory JobCityModel.fromJson(Map<String, dynamic> json) {
    return JobCityModel(
      entity: JobCityEntity(
        id: json['id'],
        name: json['name'],
        multiName: json['multi_name'] != null
            ? JobMultiName(
                ar: json['multi_name']['ar'],
                en: json['multi_name']['en'],
              )
            : null,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': entity.id,
      'name': entity.name,
      'multi_name': entity.multiName != null
          ? {'ar': entity.multiName!.ar, 'en': entity.multiName!.en}
          : null,
    };
  }

  JobCityEntity toEntity() => entity;
}
