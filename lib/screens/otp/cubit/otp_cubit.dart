import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());

  void otp(String pin1, String pin2, String pin3, String pin4) {
    if(pin1.isEmpty || pin2.isEmpty || pin3.isEmpty || pin4.isEmpty){
        emit(InvalidOtpState('Vui lòng nhập mã xác thực'));
      }else{
        emit(ValidOtpState());
      }
      emit(SuccessState());
  }
}
