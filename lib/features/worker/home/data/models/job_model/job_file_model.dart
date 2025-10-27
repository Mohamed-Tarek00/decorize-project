import 'package:decorize_project/features/worker/home/domain/entites/job_file_entity.dart';

class JobFileModel {
  final int id;
  final String url;

  JobFileModel({required this.id, required this.url});

  factory JobFileModel.fromJson(Map<String, dynamic> json) {
    return JobFileModel(id: json['id'], url: json['url']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'url': url};
  }

  JobFileEntity toEntity() {
    return JobFileEntity(id: id, url: url);
  }

  factory JobFileModel.fromEntity(JobFileEntity entity) {
    return JobFileModel(id: entity.id, url: entity.url);
  }
}
