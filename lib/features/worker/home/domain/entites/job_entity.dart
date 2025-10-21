import 'package:decorize_project/features/worker/home/domain/entites/job_city_entity.dart';
import 'package:decorize_project/features/worker/home/domain/entites/job_file_entity.dart';
import 'package:decorize_project/features/worker/home/domain/entites/job_governate_entity.dart';
import 'package:decorize_project/features/worker/home/domain/entites/job_type_entity.dart';

class JobEntity {
  final int id;
  final String title;
  final String content;
  final String budget;
  final int numberOfDays;
  final String slug;
  final String lat;
  final String long;
  final String? location;
  final String status;
  final String? reason;
  final String serialNumber;
  final int acceptedOffersCount;
  final String createdAt;
  final JobGovernorateEntity? governorate;
  final JobCityEntity? city;
  final List<JobFileEntity> files;
  final List<JobTypeEntity> types;
  final dynamic authUserStatus;

  JobEntity({
    required this.id,
    required this.title,
    required this.content,
    required this.budget,
    required this.numberOfDays,
    required this.slug,
    required this.lat,
    required this.long,
    this.location,
    required this.status,
    this.reason,
    required this.serialNumber,
    required this.acceptedOffersCount,
    required this.createdAt,
    this.governorate,
    this.city,
    this.files = const [],
    this.types = const [],
    this.authUserStatus,
  });
}
