import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vidya_unity/common/apis/course_api.dart';
import 'package:vidya_unity/global.dart';
import 'package:vidya_unity/profile/buy_courses/bloc/buy_courses_bloc.dart';
import 'package:vidya_unity/profile/buy_courses/bloc/buy_courses_events.dart';

class BuyCourseController{
  late BuildContext context;
  BuyCourseController({required this.context});


  void Init()async{
    context.read<BuyCoursesBloc>().add(TriggerLoadingBuyCoursesEvents());

   await loadBuyCoursesData();
  }


  Future loadBuyCoursesData()async{
    var result = await CourseAPI.getCoursesInUserEnrolled();

    if(result.status==200){
     if(context.mounted){
       print(result.data);
       context.read<BuyCoursesBloc>().add(TriggerDoneLoadingBuyCoursesEvents());
       Future.delayed(Duration(microseconds: 10),()=>  context.read<BuyCoursesBloc>().add(TriggerLoadedBuyCouresEvents(result.data!)));
     }
   }
  }
}