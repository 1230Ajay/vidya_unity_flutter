import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vidya_unity/home/bloc/home_events.dart';
import 'package:vidya_unity/home/bloc/home_states.dart';

class HomePageBloc extends Bloc<HomePageEvents,HomePageState>{
  HomePageBloc():super(HomePageState()){
    on<SliderIndexEvent>(_sliderIndexEvent);
    on<HomePageCourseItem>(_homePageCourseItem);
  }

  void _sliderIndexEvent(SliderIndexEvent events , Emitter<HomePageState> emit){
    emit(state.copyWith(index: events.index));
  }

  void _homePageCourseItem(HomePageCourseItem event,Emitter<HomePageState> emit){
    emit(state.copyWith(courses: event.courses));
  }
}