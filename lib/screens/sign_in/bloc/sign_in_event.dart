part of 'sign_in_bloc.dart';

class SignInEvent extends Equatable {
  String phone;
  String password;
  SignInEvent(this.phone,  this.password);

  @override
  List<Object> get props => [];
}
