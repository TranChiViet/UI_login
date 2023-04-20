part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  bool obscurePassword;
  bool obscureRePassword;
  SignUpState({
    this.obscurePassword = false,
    this.obscureRePassword = false,
  });

  @override
  List<Object> get props => [
        obscurePassword,
        obscureRePassword,
      ];
}

class SignUpInitial extends SignUpState {}