import 'package:decorize_project/features/worker/home/domain/entites/job_city_entity.dart';

class JobTypeEntity {
  final int id;
  final String name;
  final JobMultiName? multiName;

  JobTypeEntity({required this.id, required this.name, this.multiName});
}
