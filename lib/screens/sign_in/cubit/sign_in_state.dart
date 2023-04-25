part of 'sign_in_cubit.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

class InvalidPhoneState extends SignInState {
  InvalidPhoneState(this.content);

  final String content;

  List<Object> get props => [content];
}

class InvalidPasswordState extends SignInState {
  InvalidPasswordState(this.content);

  final String content;

  List<Object> get props => [content];
}

class SignInInitial extends SignInState {}
