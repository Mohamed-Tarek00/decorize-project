import 'package:decorize_project/features/worker/home/domain/entites/job_city_entity.dart';
import 'package:decorize_project/features/worker/home/domain/entites/job_type_entity.dart';

class JobTypeModel {
  final int id;
  final String name;
  final JobMultiName? multiName;

  JobTypeModel({required this.id, required this.name, this.multiName});

  factory JobTypeModel.fromJson(Map<String, dynamic> json) {
    return JobTypeModel(
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

  JobTypeEntity toEntity() {
    return JobTypeEntity(id: id, name: name, multiName: multiName);
  }

  factory JobTypeModel.fromEntity(JobTypeEntity entity) {
    return JobTypeModel(
      id: entity.id,
      name: entity.name,
      multiName: entity.multiName,
    );
  }
}
