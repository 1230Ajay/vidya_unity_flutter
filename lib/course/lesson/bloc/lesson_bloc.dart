import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vidya_unity/course/lesson/bloc/lesson_events.dart';
import 'package:vidya_unity/course/lesson/bloc/lesson_states.dart';

class LessonBloc extends Bloc<LessonEvents,LessonStates>{
  LessonBloc():super(LessonStates()){
    on<TriggerLessonEvent>(_triggerLessonVied);
    on<TriggerUrlItem>(_triggerUrlItem);
    on<TriggerPlay>(_triggerPlay);
  }

  void _triggerLessonVied(TriggerLessonEvent event,Emitter<LessonStates> emit){
    emit(state.copyWith(lessonItem: event.lessonItem));
  }

  void _triggerUrlItem(TriggerUrlItem event,Emitter<LessonStates> emit){
    emit(state.copyWith(initializeVideoPlayerFuture: event.initVideoPlayerFuture));
  }

  void _triggerPlay(TriggerPlay event,Emitter<LessonStates> emit){
    emit(state.copyWith(isPlay: event.isPlay));
  }
}