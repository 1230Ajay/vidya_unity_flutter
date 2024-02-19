import 'package:flutter_bloc/flutter_bloc.dart';

import 'buy_courses_events.dart';
import 'buy_courses_states.dart';

class BuyCoursesBloc extends Bloc<BuyCoursesEvents,BuyCoursesStates>{

  BuyCoursesBloc():super(const InitialBuyCoursesStates()){
    on<TriggerInitialBuyCoursesEvents>(_initialMyCoursesEvents);
    on<TriggerLoadingBuyCoursesEvents>(_triggerLoadingMyCoursesEvents);
    on<TriggerLoadedBuyCouresEvents>(_triggerLoadedBuyCouresEvents);
    on<TriggerDoneLoadingBuyCoursesEvents>(_triggerDoneLoadingMyCoursesEvents);
  }




  _initialMyCoursesEvents(TriggerInitialBuyCoursesEvents events , Emitter<BuyCoursesStates> emit){
    print("..........................Initial.......................");
    emit(InitialBuyCoursesStates());
  }

  _triggerLoadedBuyCouresEvents(TriggerLoadedBuyCouresEvents events , Emitter<BuyCoursesStates> emit){
    print("..........................Loaded.......................");
    emit(LoadedBuyCouresState(courseItem:events.courseItem));
  }

  _triggerLoadingMyCoursesEvents(TriggerLoadingBuyCoursesEvents event,Emitter<BuyCoursesStates> emit){
    //we are calling state classes directly
    print("..........................Loading.......................");
    emit(const LoadingBuyCoursesStates());
  }

  _triggerDoneLoadingMyCoursesEvents(
      TriggerDoneLoadingBuyCoursesEvents event, Emitter<BuyCoursesStates> emit) {
    print("..........................Done.......................");
    emit(DoneLoadingBuyCoursesStates());
  }

}