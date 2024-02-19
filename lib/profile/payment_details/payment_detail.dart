import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vidya_unity/profile/payment_details/cubit/payment_detail_cubits.dart';
import 'package:vidya_unity/profile/payment_details/cubit/payment_detail_states.dart';
import 'package:vidya_unity/profile/payment_details/payment_details_controller.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({super.key});

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  late PaymentDetailsController _paymentDetailsController;

  @override
  void didChangeDependencies() {
    _paymentDetailsController = PaymentDetailsController(context: context);
    _paymentDetailsController.Init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentDetailCubit,PaymentDetailStates>(builder: (context , state){
      return Scaffold(
        appBar: AppBar(),
        body: Center(child: Text("this text from cubit"),),
      );
    });
  }
}
