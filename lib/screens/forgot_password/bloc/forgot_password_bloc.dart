import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordInitial()) {
    on<ForgotPasswordEvent>((event, emit) {
      if(event.phone.isEmpty){
        emit(InvalidPhoneState('Vui lòng nhập số điện thoại'));
      } else if(event.phone.isNotEmpty && event.phone.length<10){
        emit(InvalidPhoneState('Số điện thoại chứa ít nhất 10 kí tự'));
      }else{
        emit(ValidPhoneState());
      }
      emit(ForgotPasswordInitial());
    });
  }
}
