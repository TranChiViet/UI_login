import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_password_state.dart';

class GetPasswordCubit extends Cubit<GetPasswordState> {
  GetPasswordCubit() : super(GetPasswordInitial());

  void getPassword(String newPassword, String password) {
    if (newPassword.isEmpty) {
      emit(InvalidNewPasswordState('Vui lòng nhập mật khẩu mới'));
    } else if (newPassword.isNotEmpty && newPassword.length < 8) {
      emit(InvalidNewPasswordState('Mật khẩu chứa ít nhất 8 kí tự'));
    } else if (password != newPassword) {
      emit(InvalidPasswordState('Xác nhận sai mật khẩu'));
    }

    emit(GetPasswordInitial());
  }
}
