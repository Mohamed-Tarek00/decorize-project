import 'package:decorize_project/features/worker/home/domain/entites/job_governate_entity.dart';

class JobGovernateModel {
  final int id;
  final String name;
  final int status;

  JobGovernateModel({
    required this.id,
    required this.name,
    required this.status,
  });

  factory JobGovernateModel.fromJson(Map<String, dynamic> json) {
    return JobGovernateModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'status': status};
  }

  JobGovernorateEntity toEntity() {
    return JobGovernorateEntity(id: id, name: name, status: status);
  }

  factory JobGovernateModel.fromEntity(JobGovernorateEntity entity) {
    return JobGovernateModel(
      id: entity.id,
      name: entity.name,
      status: entity.status,
    );
  }
}
