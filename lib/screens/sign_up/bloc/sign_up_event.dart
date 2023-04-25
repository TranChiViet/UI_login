part of 'sign_up_bloc.dart';

class SignUpEvent extends Equatable {
  String name;
  String phone;
  String password;
  String rePassword;
  SignUpEvent(this.name, this.phone, this.password, this.rePassword);

  @override
  List<Object> get props => [];
}
