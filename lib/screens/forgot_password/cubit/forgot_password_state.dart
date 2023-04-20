part of 'fotgot_password_cubit.dart';

class ForgotPasswordState extends Equatable {
  bool correctPhone;
  ForgotPasswordState({
    this.correctPhone = true,
  });

  @override
  List<Object> get props => [
        correctPhone,
      ];
}

class ForgotPasswordInitial extends ForgotPasswordState {}
