import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vidya_unity/register/bloc/register_events.dart';
import 'package:vidya_unity/register/bloc/register_states.dart';

class RegisterBloc extends Bloc<RegisterEvents,RegisterStates>{
  RegisterBloc():super(RegisterStates()){
    on<FirstNameEvent>(_firstNameEvent);
    on<LastNameEvent>(_lastNameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<RePasswordEvent>(_rePasswordEvent);
  }

  void _firstNameEvent(FirstNameEvent event,Emitter<RegisterStates> emit){
    emit(state.copyWith(first_name: event.first_name));
  }

  void _lastNameEvent(LastNameEvent event,Emitter<RegisterStates> emit){
    emit(state.copyWith(last_name: event.last_name));
  }

  void _emailEvent(EmailEvent event,Emitter<RegisterStates> emit){
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event,Emitter<RegisterStates> emit){
    emit(state.copyWith(password: event.password));
  }

  void _rePasswordEvent(RePasswordEvent event,Emitter<RegisterStates> emit){
    emit(state.copyWith(re_password: event.re_password));
  }

}
