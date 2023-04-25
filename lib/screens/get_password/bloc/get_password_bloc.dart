import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_password_event.dart';
part 'get_password_state.dart';

class GetPasswordBloc extends Bloc<GetPasswordEvent, GetPasswordState> {
  GetPasswordBloc() : super(GetPasswordInitial()) {
    on<GetPasswordEvent>((event, emit) {
      if (event.newPassword.isEmpty) {
        emit(InvalidNewPasswordState('Vui lòng nhập mật khẩu mới'));
      } else
      if (event.newPassword.isNotEmpty && event.newPassword.length < 8) {
        emit(InvalidNewPasswordState('Mật khẩu chứa ít nhất 8 kí tự'));
      } else
      if (event.password != event.newPassword) {
        emit(InvalidPasswordState('Xác nhận sai mật khẩu'));
      }

      emit(GetPasswordInitial());
    });
  }
}
