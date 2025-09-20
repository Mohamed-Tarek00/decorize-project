import 'package:bloc/bloc.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/verification.dart';
import 'package:decorize_project/features/shared/auth/domain/usecases/otp_verification_use_case.dart';
import 'package:decorize_project/features/shared/auth/presentation/cubits/otp_key/otp_key_state.dart';

class OtpKeyCubit extends Cubit<OtpKeyState> {
  OtpKeyCubit(this.otpVerificationUseCase) : super(OtpKeyInitial());
  final OtpVerificationUseCase otpVerificationUseCase;
  Future<void> sendOtpKey(Verification entity) async {
    emit(OtpKeyLoading());
    final result = await otpVerificationUseCase(entity);
    result.fold(
      (failure) => emit(OtpKeyFailure(failure.toString())),
      (response) => emit(OtpKeyLoaded(response)),
    );
  }
}
