import 'package:decorize_project/features/worker/home/data/models/job_model/job_city_model.dart';
import 'package:decorize_project/features/worker/home/data/models/job_model/job_file_model.dart';
import 'package:decorize_project/features/worker/home/data/models/job_model/job_governate_model.dart';
import 'package:decorize_project/features/worker/home/data/models/job_model/job_type_model.dart';
import 'package:decorize_project/features/worker/home/domain/entites/job_entity.dart';

class JobModel {
  final JobEntity entity;

  JobModel({required this.entity});

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      entity: JobEntity(
        id: json['id'],
        title: json['title'],
        content: json['content'],
        budget: json['budget'],
        numberOfDays: json['number_of_days'],
        slug: json['slug'],
        lat: json['lat'] ?? '',
        long: json['long'] ?? '',
        location: json['location'],
        status: json['status'],
        reason: json['reason'],
        serialNumber: json['serial_number'],
        acceptedOffersCount: json['accepted_offers_count'] ?? 0,
        createdAt: json['created_at'],
        governorate: json['governorate_id'] != null
            ? JobGovernateModel.fromJson(json['governorate_id']).toEntity()
            : null,
        city: json['city_id'] != null
            ? JobCityModel.fromJson(json['city_id']).toEntity()
            : null,
        files:
            (json['files'] as List<dynamic>?)
                ?.map((e) => JobFileModel.fromJson(e).toEntity())
                .toList() ??
            [],
        types:
            (json['types'] as List<dynamic>?)
                ?.map((e) => JobTypeModel.fromJson(e).toEntity())
                .toList() ??
            [],
        authUserStatus: json['auth_user_status'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': entity.id,
      'title': entity.title,
      'content': entity.content,
      'budget': entity.budget,
      'number_of_days': entity.numberOfDays,
      'slug': entity.slug,
      'lat': entity.lat,
      'long': entity.long,
      'location': entity.location,
      'status': entity.status,
      'reason': entity.reason,
      'serial_number': entity.serialNumber,
      'accepted_offers_count': entity.acceptedOffersCount,
      'created_at': entity.createdAt,
      'governorate_id': entity.governorate != null
          ? JobGovernateModel(entity: entity.governorate!).toJson()
          : null,
      'city_id': entity.city != null
          ? JobCityModel(entity: entity.city!).toJson()
          : null,
      'files': entity.files
          .map((e) => JobFileModel(entity: e).toJson())
          .toList(),
      'types': entity.types
          .map((e) => JobTypeModel(entity: e).toJson())
          .toList(),
      'auth_user_status': entity.authUserStatus,
    };
  }

  JobEntity toEntity() => entity;
}
