import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vidya_unity/sign_in/bloc/sign_in_events.dart';
import 'package:vidya_unity/sign_in/bloc/sign_in_states.dart';

class SignInBloc extends Bloc<SignInEvents,SignInStates>{
  SignInBloc():super(SignInStates()){
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent event,Emitter<SignInStates> emit){
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event,Emitter<SignInStates> emit){
    emit(state.copyWith(password: event.password));
  }
}