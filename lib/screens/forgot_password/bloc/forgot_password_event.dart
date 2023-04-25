part of 'forgot_password_bloc.dart';

class ForgotPasswordEvent extends Equatable {
  String phone;
  ForgotPasswordEvent(this.phone);

  @override
  List<Object> get props => [];
}
