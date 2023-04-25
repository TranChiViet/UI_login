part of 'get_password_bloc.dart';

class GetPasswordEvent extends Equatable {
  String newPassword;
  String password;
  GetPasswordEvent(this.newPassword, this.password);

  @override
  List<Object> get props => [];
}
