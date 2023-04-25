import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitial());

  void forgotPassword(String phone) {
    if(phone.isEmpty){
        emit(InvalidPhoneState('Vui lòng nhập số điện thoại'));
      } else if(phone.isNotEmpty && phone.length<10){
        emit(InvalidPhoneState('Số điện thoại chứa ít nhất 10 kí tự'));
      }else{
        emit(ValidPhoneState());
      }
      emit(ForgotPasswordInitial());
  }
}
