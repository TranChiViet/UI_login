part of 'get_password_cubit.dart';

class GetPasswordState extends Equatable {
  bool obscurePassword;
  bool obscureNewPassword;
  GetPasswordState({
    this.obscurePassword = false,
    this.obscureNewPassword = false,
  });

  @override
  List<Object> get props => [
        obscurePassword,
        obscureNewPassword,
      ];
}


class GetPasswordInitial extends GetPasswordState {}
