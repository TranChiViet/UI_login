import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc() : super(OtpInitial()) {
    on<OtpEvent>((event, emit) {
      if(event.pin1.isEmpty || event.pin2.isEmpty || event.pin3.isEmpty || event.pin4.isEmpty){
        emit(InvalidOtpState('Vui lòng nhập mã xác thực'));
      }else{
        emit(ValidOtpState());
      }
      emit(OtpInitial());
    });
  }
}
