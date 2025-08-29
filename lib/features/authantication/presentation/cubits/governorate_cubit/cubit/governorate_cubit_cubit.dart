import 'package:bloc/bloc.dart';
import 'package:decorize_project/features/authantication/domain/usecases/get_governorates_use_case.dart';
import 'package:decorize_project/features/authantication/presentation/cubits/governorate_cubit/cubit/governorate_cubit_state.dart';
import 'package:meta/meta.dart';

class GovernorateCubit extends Cubit<GovernorateState> {
  final GetGovernoratesUseCase getGovernoratesUseCase;

  GovernorateCubit(this.getGovernoratesUseCase) : super(GovernorateInitial());

  Future<void> fetchGovernorates() async {
    emit(GovernorateLoading());
    final result = await getGovernoratesUseCase();

    result.fold(
      (failure) => emit(GovernorateError(failure.toString())),
      (governorates) => emit(GovernorateLoaded(governorates)),
    );
  }
}
