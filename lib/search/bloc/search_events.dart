import '../../common/entities/course.dart';

abstract class SearchEvents{
  const SearchEvents();
}


class TriggerSearchEvent extends SearchEvents{
  const TriggerSearchEvent({required this.courseItem});
  final List<CourseItem> courseItem;
}

class TriggerSearchEventItem extends SearchEvents{
  final String? searchItem;
  const TriggerSearchEventItem({this.searchItem});
}