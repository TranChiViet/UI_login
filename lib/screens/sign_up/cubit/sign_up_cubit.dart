import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  switchPassword() {
    bool obscurePassword = state.obscurePassword;
    obscurePassword = !obscurePassword;
    emit(SignUpState(
      obscurePassword: obscurePassword,
      obscureRePassword: state.obscureRePassword,
    ));
  }

  switchRePassword() {
    bool obscureRePassword = state.obscureRePassword;
    obscureRePassword = !obscureRePassword;
    emit(SignUpState(
      obscureRePassword: obscureRePassword,
      obscurePassword: state.obscurePassword,
    ));
  }
}
