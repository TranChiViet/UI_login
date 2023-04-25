part of 'otp_cubit.dart';

abstract class OtpState extends Equatable {
  const OtpState();

  @override
  List<Object> get props => [];
}

class InvalidOtpState extends OtpState {
  InvalidOtpState(this.content);

  final String content;

  List<Object> get props => [content];
}

class ValidOtpState extends OtpState {}

class OtpInitial extends OtpState {}
