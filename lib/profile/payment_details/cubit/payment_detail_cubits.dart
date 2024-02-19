import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vidya_unity/profile/payment_details/cubit/payment_detail_states.dart';

class PaymentDetailCubit extends Cubit<PaymentDetailStates>{
  PaymentDetailCubit():super(InitialPaymentDetailStates());

  void historyPaymentDetails(){
    //here we are emitting states of history
    emit(HistoryPaymentDetailStates());
  }

  void loadingiHistoryPaymentDetails(){
    //here we are emitting states of history
    emit(LoadingPaymentDetailStates());
  }

  void doneLoadingiHistoryPaymentDetails(){
    //here we are emitting states of history
    emit(DoneLoadingPaymentDetailStates());
  }
}