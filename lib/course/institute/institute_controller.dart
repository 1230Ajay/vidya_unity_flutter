import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vidya_unity/common/apis/course_api.dart';
import 'package:vidya_unity/common/entities/course.dart';
import 'package:vidya_unity/course/institute/cubit/institute_cubit.dart';

class InstituteController{
  late BuildContext context;
  InstituteController(this.context);

  void Init(){
   final args = ModalRoute.of(context)!.settings.arguments as Map;
   AuthorData(args["uid"]);
  }

  Future<void> AuthorData(String uid) async {
    print(uid);
    AuthorRequestEntity authorRequestEntity = AuthorRequestEntity(uid: uid);
    var authDetails = await CourseAPI.getAuthorDetails(authorRequestEntity);

    if(authDetails.code==200){
      AuthorItem authorItem =  authDetails.data!;
      List<CourseItem> coursesOfAuthor = authDetails.courses??<CourseItem>[];
      context.read<InstituteCubits>().TriggerTutorDetail(authorItem);
      context.read<InstituteCubits>().TriggerCourseDetail(coursesOfAuthor);

      print(coursesOfAuthor[0].image);
    }
  }

}