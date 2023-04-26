import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  void signup(String name, String phone, String password, String rePassword) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (name.isEmpty) {
      emit(InvalidNameState('Vui lòng nhập họ tên người dùng'));
    } else if (phone.isEmpty) {
      emit(InvalidPhoneState('Vui lòng nhập số điện thoại'));
    } else if (!regExp.hasMatch(phone)) {
      emit(InvalidPhoneState('Số điện thoại không tồn tại'));
    } else if (password.isEmpty) {
      emit(InvalidPasswordState('Vui lòng nhập mật khẩu'));
    } else if (password.isNotEmpty && password.length < 8) {
      emit(InvalidPasswordState('Mật khẩu chứa ít nhất 8 kí tự'));
    } else if (password != rePassword) {
      emit(InvalidRePasswordState('Xác nhận sai mật khẩu'));
    }

    emit(SuccessState());
  }
}
