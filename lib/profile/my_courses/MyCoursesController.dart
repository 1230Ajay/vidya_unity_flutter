import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vidya_unity/common/apis/course_api.dart';
import 'package:vidya_unity/profile/my_courses/bloc/my_courses_bloc.dart';
import 'package:vidya_unity/profile/my_courses/bloc/my_courses_event.dart';

class MyCoursesController{
  late BuildContext context;
  MyCoursesController({required this.context});

  Future<void> Init() async {
    loadCourseData();
  }

  void loadCourseData()async{
        context.read<MyCoursesBloc>().add(const TriggerLoadingMyCoursesEvents());
        var result = await CourseAPI.CourseList();
        if(result.status==200){
         if(context.mounted){
           context.read<MyCoursesBloc>().add(const TriggerLoadedMyCouresEvents([]));
           Future.delayed(Duration(microseconds: 10),()=>context.read<MyCoursesBloc>().add(const TriggerDoneLoadingMyCoursesEvents()));
         }
        }
  }
}