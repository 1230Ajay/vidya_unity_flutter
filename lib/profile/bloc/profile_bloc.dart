import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vidya_unity/profile/bloc/profile_event.dart';

import 'package:vidya_unity/profile/bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvents,ProfileState>{
  ProfileBloc():super(const ProfileState()){
    on<TriggerProfile>(_triggerProfile);
  }

  void _triggerProfile(TriggerProfile event,Emitter<ProfileState> emit){
     emit(state.copyWith(profile: event.profile));
  }

}