import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vidya_unity/search/bloc/search_events.dart';
import 'package:vidya_unity/search/bloc/search_states.dart';

class SearchBloc extends Bloc<SearchEvents,SearchStates>{
  SearchBloc():super(SearchStates()){
    on<TriggerSearchEvent>(_triggerSerchEvent);
    on<TriggerSearchEventItem>(_triggerSerchItemEvent);
  }

  void _triggerSerchEvent(TriggerSearchEvent event,Emitter<SearchStates> emit){
    emit(state.copyWith(courseItem: event.courseItem));
  }

  void _triggerSerchItemEvent(TriggerSearchEventItem event,Emitter<SearchStates> emit){
    emit(state.copyWith(searchItem: event.searchItem));
  }
}