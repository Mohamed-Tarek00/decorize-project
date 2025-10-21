// governorate_model.dart
import 'package:decorize_project/features/worker/home/domain/entites/job_governate_entity.dart';

class JobGovernateModel {
  final JobGovernorateEntity entity;

  JobGovernateModel({required this.entity});

  factory JobGovernateModel.fromJson(Map<String, dynamic> json) {
    return JobGovernateModel(
      entity: JobGovernorateEntity(
        id: json['id'],
        name: json['name'],
        status: json['status'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': entity.id, 'name': entity.name, 'status': entity.status};
  }

  JobGovernorateEntity toEntity() => entity;
}
