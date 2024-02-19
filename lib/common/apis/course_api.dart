import 'package:vidya_unity/common/entities/course.dart';
import 'package:vidya_unity/common/entities/entities.dart';
import 'package:vidya_unity/common/utils/http_utils.dart';

class CourseAPI{
  static Future<CourseListResponseEntity> CourseList() async {
    var res = await HttpUtil().get(path: "auth/courses/");
    Map<String,dynamic> data = {"data":res.data};
    return CourseListResponseEntity.fromJson(data: data, status: res.statusCode!);
  }


  static Future<CourseListResponseEntity> SearchedCourseList({required SearchRequestEntity search}) async {
    var res = await HttpUtil().get(path: "auth/course/recommended/",queryParameters: search.toJson());
    Map<String,dynamic> data = {"data":res.data};
    return CourseListResponseEntity.fromJson(data: data, status: res.statusCode!);
  }

  static Future<CourseListDetailResponseEntity> CourseDetail({required CourseRequestEntity courseRequestEntity}) async {
    var res = await HttpUtil().get(path: "auth/course/${courseRequestEntity.toJson()["uid"]}/");
    Map<String,dynamic> data = {"data":[res.data["data"]]};
    Map<String,dynamic> videos = {"videos":res.data["videos"]};
    return CourseListDetailResponseEntity.fromJson(data:data,videos:videos,status: res.statusCode!);
  }

  static Future<LessonDetailResponseEntity> lessonDetail({required LessonRequestEntity lessonRequestEntity}) async {
    var res = await HttpUtil().get(path: "course/lesson/${lessonRequestEntity.toJson()["uid"]}");
    Map<String,dynamic> lesson = {"videos":res.data};
    return LessonDetailResponseEntity.fromJson(data:lesson,code: res.statusCode!);
  }

  static Future<CourseListResponseEntity> getCoursesInUserEnrolled() async {
    var res = await HttpUtil().get(path: "auth/course-in-students/");
    Map<String,dynamic> data = {"data":res.data};
    print(res.data);
    return CourseListResponseEntity.fromJson(data: data, status: res.statusCode!);
  }

  static Future<AuthorResponseEntity> getAuthorDetails(AuthorRequestEntity authorRequestEntity) async {
    var res = await HttpUtil().get(path: "auth/user/${authorRequestEntity.uid}");
    Map<String,dynamic> data = {"data":res.data["data"]};
    Map<String,dynamic> courses = {"courses":res.data["courses"]};
    return AuthorResponseEntity.fromJson(data:data,courses:courses,status:res.statusCode!);
  }

}