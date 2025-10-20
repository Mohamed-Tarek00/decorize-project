import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/core/location/domain/entities/location_entity.dart';

abstract class LocationRepo {
  Future<Either<Failure,LocationEntity>> getLocation({ required double latitude, required double longitude , String language= 'ar'});
}