import 'package:decorize_project/features/worker/home/data/models/job_model/job_city_model.dart';
import 'package:decorize_project/features/worker/home/data/models/job_model/job_file_model.dart';
import 'package:decorize_project/features/worker/home/data/models/job_model/job_governate_model.dart';
import 'package:decorize_project/features/worker/home/data/models/job_model/job_type_model.dart';
import 'package:decorize_project/features/worker/home/domain/entites/job_entity.dart';

class WorkerJobModel {
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
  final JobGovernateModel? governorate;
  final JobCityModel? city;
  final List<JobTypeModel> types;
  final List<JobFileModel> files;
  final dynamic authUserStatus;

  WorkerJobModel({
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
    required this.types,
    required this.files,
    this.authUserStatus,
  });

  factory WorkerJobModel.fromJson(Map<String, dynamic> json) {
    return WorkerJobModel(
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
          ? JobGovernateModel.fromJson(json['governorate_id'])
          : null,
      city: json['city_id'] != null
          ? JobCityModel.fromJson(json['city_id'])
          : null,
      files:
          (json['files'] as List<dynamic>?)
              ?.map((e) => JobFileModel.fromJson(e))
              .toList() ??
          [],
      types:
          (json['types'] as List<dynamic>?)
              ?.map((e) => JobTypeModel.fromJson(e))
              .toList() ??
          [],
      authUserStatus: json['auth_user_status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'budget': budget,
      'number_of_days': numberOfDays,
      'slug': slug,
      'lat': lat,
      'long': long,
      'location': location,
      'status': status,
      'reason': reason,
      'serial_number': serialNumber,
      'accepted_offers_count': acceptedOffersCount,
      'created_at': createdAt,
      'governorate_id': governorate?.toJson(),
      'city_id': city?.toJson(),
      'files': files.map((e) => e.toJson()).toList(),
      'types': types.map((e) => e.toJson()).toList(),
      'auth_user_status': authUserStatus,
    };
  }

  WorkerJobEntity toEntity() {
    return WorkerJobEntity(
      id: id,
      title: title,
      content: content,
      budget: budget,
      numberOfDays: numberOfDays,
      lat: lat,
      long: long,
      status: status,
      acceptedOffersCount: acceptedOffersCount,
      createdAt: createdAt,
      files: files.map((e) => e.toEntity()).toList(),
      types: types.map((e) => e.toEntity()).toList(),
    );
  }
}
