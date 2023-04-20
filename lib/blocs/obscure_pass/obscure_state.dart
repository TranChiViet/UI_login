// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'obscure_bloc.dart';

class TextFieldState extends Equatable {
  final bool showPassword;
  final bool showRePassword;
  const TextFieldState({this.showPassword = false, this.showRePassword = false});
  // const TextFieldState();

  @override
  List<Object> get props => [
        showPassword,
        showRePassword,
      ];
}

// class ObscurePassword extends TextFieldState {
//   final bool showPassword;
//   ObscurePassword({
//     this.showPassword = false,
//   });
//   @override
//   List<Object> get props => [showPassword];
// }

// class ObscureRePassword extends TextFieldState {
//   final bool showRePassword;
//   ObscureRePassword({
//     this.showRePassword = false,
//   });
//   @override
//   List<Object> get props => [showRePassword];
// }

class ObscureInitial extends TextFieldState {}
