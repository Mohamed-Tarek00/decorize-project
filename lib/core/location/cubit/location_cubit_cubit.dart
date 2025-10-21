
import 'package:bloc/bloc.dart';
import 'package:decorize_project/core/location/cubit/location_cubit_state.dart';
import 'package:decorize_project/core/location/domain/usecases/location_use_case.dart';

class LocationCubit extends Cubit<LocationState> {
  final LocationUseCase locationUseCase;

  LocationCubit(this.locationUseCase) : super(LocationInitial());

  Future<void> getLocation({
    required double latitude,
    required double longitude,
     String language = 'ar',
  }) async {
    emit(LocationLoading());
    final result = await locationUseCase(
      latitude: latitude,
      longitude: longitude,
      language: language,
    );

    result.fold(
      (failure) => emit(LocationError(failure.toString())),
      (location) => emit(LocationLoaded(location)),
    );
  }
}