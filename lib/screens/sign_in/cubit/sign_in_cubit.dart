import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_project/blocs/obscure_pass/obscure_bloc.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  switchObscure() {
    bool showPassword = state.showPassword;
    showPassword = !showPassword;
    emit(SignInState(
      showPassword: showPassword,
      correctPassword: state.correctPassword,
      correctPhone: state.correctPhone,
    ));
  }

  switchCorrectPass() {
    bool correctPassword = true;
    emit(SignInState(
      correctPassword: correctPassword,
      correctPhone: state.correctPhone,
      showPassword: state.showPassword,
    ));
  }

  switchUnCorrectPass() {
    bool correctPassword = false;
    emit(SignInState(
      correctPassword: correctPassword,
      correctPhone: state.correctPhone,
      showPassword: state.showPassword,
    ));
  }

  switchCorrectPhone() {
    bool correctPhone = true;
    emit(SignInState(
      correctPhone: correctPhone,
      correctPassword: state.correctPassword,
      showPassword: state.showPassword,
    ));
  }

  switchUnCorrectPhone() {
    bool correctPhone = false;
    emit(SignInState(
      correctPhone: correctPhone,
      correctPassword: state.correctPassword,
      showPassword: state.showPassword,
    ));
  }
}
