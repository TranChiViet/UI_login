part of 'otp_bloc.dart';

class OtpEvent extends Equatable {
  String pin1;
  String pin2;
  String pin3;
  String pin4;
  OtpEvent(this.pin1, this.pin2, this.pin3, this.pin4);

  @override
  List<Object> get props => [];
}
