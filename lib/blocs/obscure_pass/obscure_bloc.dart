import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'obscure_event.dart';
part 'obscure_state.dart';

class ObscureBloc extends Bloc<ObscureEvent, TextFieldState> {
  ObscureBloc() : super(TextFieldState()) {
    on<ShowPassword>(_onShowPassword);
    on<ShowRePassword>(_onShowRePassword);
  }

  _onShowPassword(ShowPassword event, Emitter<TextFieldState> emit) {
    final state = this.state;
    bool showPassword = state.showPassword;
    showPassword = !showPassword;
    emit(TextFieldState(showPassword: showPassword, showRePassword: state.showRePassword));
  }

  _onShowRePassword(ShowRePassword event, Emitter<TextFieldState> emit) {
    bool showRePassword = state.showRePassword;
    showRePassword = !showRePassword;
    emit(TextFieldState(showPassword: state.showPassword,showRePassword: showRePassword));
  }
}

