import 'package:decorize_project/features/shared/profile/domain/entities/worker_details_entity.dart';

class WorkerDetailsModel {
  final WorkerDetailsEntity entity;

  WorkerDetailsModel({required this.entity});

  factory WorkerDetailsModel.fromJson(Map<String, dynamic> json) {
    final entity = WorkerDetailsEntity(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      profession: json['profession'] ?? '',
      image: json['image'] ?? '',
      gallery:
          (json['gallery'] as List<dynamic>?)
              ?.map((item) => item.toString())
              .toList() ??
          [],
      rateDistribution: Map<String, dynamic>.from(
        json['rate_distribution'] ?? {},
      ),
      avgRate: (json['avg_rate'] as num?)?.toDouble() ?? 0.0,
      ratesCount: json['rates_count'] ?? 0,
      rates: json['rates'] ?? [],
    );

    return WorkerDetailsModel(entity: entity);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': entity.id,
      'name': entity.name,
      'profession': entity.profession,
      'image': entity.image,
      'gallery': entity.gallery,
      'rate_distribution': entity.rateDistribution,
      'avg_rate': entity.avgRate,
      'rates_count': entity.ratesCount,
      'rates': entity.rates,
    };
  }

  WorkerDetailsEntity toEntity() {
    return entity;
  }
}
