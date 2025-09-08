import 'package:dartz/dartz.dart';
import 'package:decorize_project/features/shared/auth/presentation/cubits/register_request_cubit/cubit/register_request_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/register_request.dart';
import 'package:decorize_project/features/shared/auth/domain/usecases/register_use_case.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterCubit(this.registerUseCase) : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  Future<void> register(RegisterRequest request) async {
    emit(RegisterLoading());

    final Either<Failure, void> result = await registerUseCase(request);

    result.fold(
      (failure) => emit(RegisterFailure(failure.toString())),
      (_) => emit(RegisterSuccess()),
    );
  }
}
