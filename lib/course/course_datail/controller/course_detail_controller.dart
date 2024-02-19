

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vidya_unity/common/entities/course.dart';
import 'package:vidya_unity/course/course_datail/bloc/course_detail_bloc.dart';
import 'package:vidya_unity/course/course_datail/bloc/course_detail_events.dart';

import '../../../common/apis/course_api.dart';

class CourseDatailController{
  final BuildContext context;
  CourseDatailController({required this.context});

  void init()async{
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    getCourseDetail(uid: args["uid"]);
  }

   Future<void> getCourseDetail({required String uid}) async {
    CourseRequestEntity courseRequestEntity=CourseRequestEntity();
    courseRequestEntity.uid = uid.toString();

    var data = await CourseAPI.CourseDetail(courseRequestEntity:courseRequestEntity);

    List<CourseItem> courseItem = data.data!;
    List<VideoItem> videoItem = data.videos!;

   if(context.mounted){
     context.read<CourseDetailBloc>().add(TriggerCourseDetail(courseItem));
     context.read<CourseDetailBloc>().add(TriggerVideoDetail(videoItem));
   }

   }
}