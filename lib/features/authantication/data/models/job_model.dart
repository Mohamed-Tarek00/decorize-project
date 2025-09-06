import 'package:decorize_project/features/authantication/domain/entities/job.dart';

class JobModel {
  final int id;
  final String enName;
  final String arName;
  JobModel({required this.id, required this.enName, required this.arName});
  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      id: json['id'] as int,
      arName: json['multi_name']['ar'],
      enName: json['multi_name']['en'],
    );
  }
  Job toEntity() {
    return Job(id: id, arName: arName, enName: enName);
  }
}
