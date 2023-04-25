part of 'get_password_cubit.dart';

abstract class GetPasswordState extends Equatable {
  const GetPasswordState();

  @override
  List<Object> get props => [];
}

class InvalidNewPasswordState extends GetPasswordState {
  InvalidNewPasswordState(this.content);

  final String content;

  List<Object> get props => [content];
}


class InvalidPasswordState extends GetPasswordState {
  InvalidPasswordState(this.content);

  final String content;

  List<Object> get props => [content];
}

class GetPasswordInitial extends GetPasswordState {}
