import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) {
      if (event.name.isEmpty) {
        emit(InvalidNameState('Vui lòng nhập họ tên người dùng'));
      } else

      if(event.phone.isEmpty){
        emit(InvalidPhoneState('Vui lòng nhập số điện thoại'));
      } else if(event.phone.isNotEmpty && event.phone.length < 10){
        emit(InvalidPhoneState('Số điện thoại chứa ít nhất 10 kí tự'));
      } else

      if (event.password.isEmpty) {
        emit(InvalidPasswordState('Vui lòng nhập mật khẩu'));
      } else
      if (event.password.isNotEmpty && event.password.length < 8) {
        emit(InvalidPasswordState('Mật khẩu chứa ít nhất 8 kí tự'));
      } else
      if (event.password != event.rePassword) {
        emit(InvalidRePasswordState('Xác nhận sai mật khẩu'));
      }

      emit(SignUpInitial());
    });
  }
}
