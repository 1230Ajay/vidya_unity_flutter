import 'package:vidya_unity/common/entities/course.dart';

class HomePageState {
  final int index;
  final List<CourseItem>? courses;
  const HomePageState({this.index = 0,this.courses=const <CourseItem>[]});

  HomePageState copyWith({int? index,List<CourseItem>? courses}) {
    return HomePageState(index: index ?? this.index,courses: courses??this.courses);
  }
}
