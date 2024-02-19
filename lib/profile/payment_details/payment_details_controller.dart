import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vidya_unity/common/apis/course_api.dart';
import 'package:vidya_unity/global.dart';
import 'package:vidya_unity/profile/buy_courses/bloc/buy_courses_bloc.dart';
import 'package:vidya_unity/profile/buy_courses/bloc/buy_courses_events.dart';
import 'package:vidya_unity/profile/payment_details/cubit/payment_detail_cubits.dart';

class PaymentDetailsController{
  late BuildContext context;
  PaymentDetailsController({required this.context});


  void Init()async{
    context.read<PaymentDetailCubit>().loadingiHistoryPaymentDetails();
     await loadBuyCoursesData();
  }


  Future loadBuyCoursesData()async{
    var result = await CourseAPI.getCoursesInUserEnrolled();

    if(result.status==200){
     if(context.mounted){
       context.read<PaymentDetailCubit>().doneLoadingiHistoryPaymentDetails();
       Future.delayed(Duration(microseconds: 10),()=>  context.read<PaymentDetailCubit>().historyPaymentDetails());
     }
   }
  }
}