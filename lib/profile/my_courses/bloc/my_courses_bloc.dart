import 'package:flutter_bloc/flutter_bloc.dart';

import 'my_courses_event.dart';
import 'my_courses_state.dart';


//for each state we are using a diffrent class
//that we can check our state type

class MyCoursesBloc extends Bloc<MyCoursesEvents,MyCoursesState>{

  MyCoursesBloc():super(const InitialMyCoursesState()){
    on<TriggerInitialMyCoursesEvents>(_initialMyCoursesEvents);
    on<TriggerLoadingMyCoursesEvents>(_triggerLoadingMyCoursesEvents);
    on<TriggerLoadedMyCouresEvents>(_triggerLoadedMyCouresEvents);
    on<TriggerDoneLoadingMyCoursesEvents>(_triggerDoneLoadingMyCoursesEvents);
  }




  _initialMyCoursesEvents(TriggerInitialMyCoursesEvents events , Emitter<MyCoursesState> emit){
    print("..........................Initial.......................");
    emit(InitialMyCoursesState());
  }

  _triggerLoadedMyCouresEvents(TriggerLoadedMyCouresEvents events , Emitter<MyCoursesState> emit){
    print("..........................Loaded.......................");
  // emit(LoadedMyCouresState(events.courseItem));
  }

  _triggerLoadingMyCoursesEvents(TriggerLoadingMyCoursesEvents event,Emitter<MyCoursesState> emit){
    //we are calling state classes directly
    print("..........................Loading.......................");
    emit(const LoadingMyCoursesStates());
  }

  _triggerDoneLoadingMyCoursesEvents(
      TriggerDoneLoadingMyCoursesEvents event, Emitter<MyCoursesState> emit) {
    print("..........................Done.......................");
    emit(DoneLoadingMyCoursesStates());
  }

}