// file_model.dart
import 'package:decorize_project/features/worker/home/domain/entites/job_file_entity.dart';

class JobFileModel {
  final JobFileEntity entity;

  JobFileModel({required this.entity});

  factory JobFileModel.fromJson(Map<String, dynamic> json) {
    return JobFileModel(
      entity: JobFileEntity(id: json['id'], url: json['url']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': entity.id, 'url': entity.url};
  }

  JobFileEntity toEntity() => entity;
}
