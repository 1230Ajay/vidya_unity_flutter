import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vidya_unity/course/course_pay_web_view/bloc/course_pay_web_events.dart';

import 'course_pay_web_states.dart';

class PayWebViewBloc extends Bloc<PayWebViewEvents,PayViewStates>{
  PayWebViewBloc():super(PayViewStates()){
    on<TriggerPaymentUrl>(_triggerPaymentUrl);
  }

  void _triggerPaymentUrl(TriggerPaymentUrl event,Emitter<PayViewStates> emit){
    emit(state.copyWith(url: event.url ));
  }

}