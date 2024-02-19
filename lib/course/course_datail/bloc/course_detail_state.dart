import 'package:vidya_unity/common/entities/course.dart';

class CourseDetailsState{

  const CourseDetailsState({this.courseItem,this.videos});
  final List<CourseItem>? courseItem;
  final List<VideoItem>? videos;

  CourseDetailsState copyWith({List<CourseItem>? courseItem,List<VideoItem>? videos}){
    return CourseDetailsState(courseItem: courseItem??this.courseItem,videos: videos??this.videos);
  }

}