import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitial());

  void forgotPassword(String phone) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if(phone.isEmpty){
        emit(InvalidPhoneState('Vui lòng nhập số điện thoại'));
      } else if(!regExp.hasMatch(phone)){
        emit(InvalidPhoneState('Số điện thoại không tồn tại'));
      }else{
        emit(ValidPhoneState());
      }
      emit(SuccessState());
  }
}
