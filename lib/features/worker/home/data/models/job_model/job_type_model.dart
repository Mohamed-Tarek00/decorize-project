// type_model.dart

import 'package:decorize_project/features/worker/home/domain/entites/job_city_entity.dart';
import 'package:decorize_project/features/worker/home/domain/entites/job_type_entity.dart';

class JobTypeModel {
  final JobTypeEntity entity;

  JobTypeModel({required this.entity});

  factory JobTypeModel.fromJson(Map<String, dynamic> json) {
    return JobTypeModel(
      entity: JobTypeEntity(
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
      'multi_name': entity.multiName,
    };
  }

  JobTypeEntity toEntity() => entity;
}
