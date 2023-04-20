import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_password_state.dart';

class GetPasswordCubit extends Cubit<GetPasswordState> {
  GetPasswordCubit() : super(GetPasswordInitial());

  switchPassword() {
    bool obscurePassword = state.obscurePassword;
    obscurePassword = !obscurePassword;
    emit(GetPasswordState(
      obscurePassword: obscurePassword,
      obscureNewPassword: state.obscureNewPassword,
    ));
  }

  switchNewPassword() {
    bool obscureNewPassword = state.obscureNewPassword;
    obscureNewPassword = !obscureNewPassword;
    emit(GetPasswordState(
      obscureNewPassword: obscureNewPassword,
      obscurePassword: state.obscurePassword,
    ));
  }
}
