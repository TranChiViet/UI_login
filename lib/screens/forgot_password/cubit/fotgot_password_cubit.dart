import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitial());

  switchCorrectPhone(){
    emit(ForgotPasswordState(correctPhone: true));
  }

  switchUnCorrectPhone(){
    emit(ForgotPasswordState(correctPhone: false));
  }
}
