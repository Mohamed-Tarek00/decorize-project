import 'package:bloc/bloc.dart';
import 'package:decorize_project/features/authantication/domain/usecases/get_cities_use_case.dart';
import 'package:decorize_project/features/authantication/presentation/cubits/city_cubit/cubit/city_state.dart';

class CityCubit extends Cubit<CityState> {
  CityCubit(this.getCitiesUseCase) : super(CityInitial());
  final GetCitiesUseCase getCitiesUseCase;
  Future<void> fetchCities(int governorateId) async {
    emit(CityLoading());
    final results = await getCitiesUseCase(governorateId);
    results.fold(
      (failure) => (emit(CityError(failure.toString()))),
      (cities) => (emit(CityLoaded(cities))),
    );
  }
}
