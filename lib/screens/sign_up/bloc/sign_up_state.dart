part of 'sign_up_bloc.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();
  
  @override
  List<Object> get props => [];
}
class InvalidNameState extends SignUpState {
  InvalidNameState(this.content);

  final String content;

  List<Object> get props => [content];
}

class InvalidPhoneState extends SignUpState {
  InvalidPhoneState(this.content);

  final String content;

  List<Object> get props => [content];
}

class InvalidRePasswordState extends SignUpState {
  InvalidRePasswordState(this.content);

  final String content;

  List<Object> get props => [content];
}


class InvalidPasswordState extends SignUpState {
  InvalidPasswordState(this.content);

  final String content;

  List<Object> get props => [content];
}
class SignUpInitial extends SignUpState {}
