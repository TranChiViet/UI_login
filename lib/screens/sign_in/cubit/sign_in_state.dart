part of 'sign_in_cubit.dart';

class SignInState extends Equatable {
  bool showPassword;
  bool correctPassword;
  bool correctPhone;
  SignInState({
    this.showPassword = false,
    this.correctPassword = true,
    this.correctPhone = true,
  });

  @override
  List<Object> get props => [
        showPassword,
        correctPassword,
        correctPhone,
      ];
}

class SignInInitial extends SignInState {}
