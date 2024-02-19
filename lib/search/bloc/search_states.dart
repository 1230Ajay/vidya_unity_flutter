import 'package:vidya_unity/common/entities/course.dart';

class SearchStates{
  final List<CourseItem> courseItem;
  final String searchItem;
  const SearchStates({this.courseItem = const <CourseItem>[],this.searchItem=""});

  SearchStates copyWith({List<CourseItem>? courseItem,String? searchItem}){
    return SearchStates(courseItem: courseItem??this.courseItem,searchItem: searchItem??this.searchItem);
  }
}

