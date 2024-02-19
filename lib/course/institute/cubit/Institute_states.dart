import '../../../common/entities/course.dart';
import '../../../common/entities/institute.dart';

class InstituteStates {
  final InstituteItem? instituteItem;
  final List<CourseItem> courseItem;
  final AuthorItem? authorItem;
  const InstituteStates({this.instituteItem, this.courseItem = const <CourseItem>[],this.authorItem});

  InstituteStates copyWith({InstituteItem? instituteItem,List<CourseItem>? courseItem,AuthorItem? authorItem}) {
    return InstituteStates(
        instituteItem: instituteItem ?? this.instituteItem,
        courseItem: courseItem??this.courseItem,
      authorItem: authorItem??this.authorItem,
    );
  }
}
