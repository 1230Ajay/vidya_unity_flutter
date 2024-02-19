import '../../common/entities/course.dart';

abstract class HomePageEvents{
  const HomePageEvents();
}


class SliderIndexEvent extends HomePageEvents{
  final int index;
  const SliderIndexEvent({required this.index});
}

class HomePageCourseItem extends HomePageEvents{
  const HomePageCourseItem(this.courses);
  final List<CourseItem> courses;
}