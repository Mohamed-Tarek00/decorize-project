import 'package:decorize_project/features/authantication/domain/entities/governorate.dart';
import 'package:decorize_project/features/authantication/domain/entities/job.dart';

abstract class JobState {}

class JobInitial extends JobState {}

class JobLoading extends JobState {}

class JobLoaded extends JobState {
  final List<Job> jobs;

  JobLoaded(this.jobs);
}

class JobError extends JobState {
  final String message;

  JobError(this.message);
}
