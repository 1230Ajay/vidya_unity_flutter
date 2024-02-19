

import '../../../common/entities/course.dart';

abstract class MyCoursesEvents{
  const MyCoursesEvents();
}


class TriggerInitialMyCoursesEvents extends MyCoursesEvents{
  const TriggerInitialMyCoursesEvents();
}

class TriggerDoneLoadingMyCoursesEvents extends MyCoursesEvents{
  const TriggerDoneLoadingMyCoursesEvents();
}


class TriggerLoadingMyCoursesEvents extends MyCoursesEvents{
  const TriggerLoadingMyCoursesEvents();
}


class TriggerLoadedMyCouresEvents extends MyCoursesEvents{
  const TriggerLoadedMyCouresEvents(this.courseItem);
  final List<CourseItem> courseItem;
}