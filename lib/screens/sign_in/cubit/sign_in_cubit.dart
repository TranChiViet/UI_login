import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  void signin(String phone, String password) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if(phone.isEmpty){
        emit(InvalidPhoneState('Vui lòng nhập số điện thoại'));
      } else if(!regExp.hasMatch(phone)){
        emit(InvalidPhoneState('Số điện thoại không tồn tại'));
      } else
      if(password.isEmpty){
        emit(InvalidPasswordState('Vui lòng nhập mật khẩu'));
      } else
      if(password.isNotEmpty && password.length < 8){
        emit(InvalidPasswordState('Mật khẩu chứa ít nhất 8 kí tự'));
      }
      emit(SuccessState());
  }
}
