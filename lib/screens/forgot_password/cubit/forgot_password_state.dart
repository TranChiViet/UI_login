part of 'forgot_password_cubit.dart';

abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object> get props => [];
}

class InvalidPhoneState extends ForgotPasswordState {
  InvalidPhoneState(this.content);

  final String content;

  List<Object> get props => [content];
}

class ValidPhoneState extends ForgotPasswordState {}

class SuccessState extends ForgotPasswordState {}

class ForgotPasswordInitial extends ForgotPasswordState {}
