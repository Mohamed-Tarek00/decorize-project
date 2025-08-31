import 'package:decorize_project/features/authantication/domain/entities/city.dart';

abstract class CityState {}

class CityInitial extends CityState {}

class CityLoading extends CityState {}

class CityLoaded extends CityState {
  final List<City> cities;

  CityLoaded(this.cities);
}

class CityError extends CityInitial {
  final String message;

  CityError(this.message);
}
