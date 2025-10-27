import 'package:decorize_project/features/worker/home/domain/entites/job_file_entity.dart';
import 'package:decorize_project/features/worker/home/domain/entites/job_type_entity.dart';

class WorkerJobEntity {
  final int id;
  final String title;
  final String content;
  final String budget;
  final int numberOfDays;
  final String lat;
  final String long;
  final String status;
  final int acceptedOffersCount;
  final String createdAt;
  final List<JobFileEntity>? files;
  final List<JobTypeEntity> types;

  WorkerJobEntity({
    required this.id,
    required this.title,
    required this.content,
    required this.budget,
    required this.numberOfDays,
    required this.lat,
    required this.long,
    required this.status,
    required this.acceptedOffersCount,
    required this.createdAt,
    this.files,
    this.types = const [],
  });
}
