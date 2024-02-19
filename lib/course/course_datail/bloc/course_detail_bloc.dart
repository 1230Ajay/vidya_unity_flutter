import 'package:flutter_bloc/flutter_bloc.dart';

import 'course_detail_events.dart';
import 'course_detail_state.dart';


class CourseDetailBloc extends Bloc<CourseDetailEvents,CourseDetailsState>{

  CourseDetailBloc():super(CourseDetailsState()){
    on<TriggerCourseDetail>(_triggerCourseDetail);
    on<TriggerVideoDetail>(_triggerVideoDetail);
  }

  void _triggerCourseDetail(TriggerCourseDetail event,Emitter<CourseDetailsState> emit){
    emit(state.copyWith(courseItem: event.courseItem));
  }

  void _triggerVideoDetail(TriggerVideoDetail event,Emitter<CourseDetailsState> emit){
    emit(state.copyWith(videos: event.videoItem));
  }

}