import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  void signin(String phone, String password) {
    if(phone.isEmpty){
        emit(InvalidPhoneState('Vui lòng nhập số điện thoại'));
      } else if(phone.isNotEmpty && phone.length < 10){
        emit(InvalidPhoneState('Số điện thoại chứa ít nhất 10 kí tự'));
      } else
      if(password.isEmpty){
        emit(InvalidPasswordState('Vui lòng nhập mật khẩu'));
      } else
      if(password.isNotEmpty && password.length < 8){
        emit(InvalidPasswordState('Mật khẩu chứa ít nhất 8 kí tự'));
      }
      emit(SignInInitial());
  }
}
