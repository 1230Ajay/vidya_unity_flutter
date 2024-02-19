import '../../../common/entities/course.dart';


abstract class CourseDetailEvents{
  const CourseDetailEvents();
}

class TriggerCourseDetail extends CourseDetailEvents{
  const TriggerCourseDetail(this.courseItem):super();
  final List<CourseItem> courseItem;
}

class TriggerVideoDetail extends CourseDetailEvents{
  const TriggerVideoDetail(this.videoItem):super();
  final List<VideoItem> videoItem;
}