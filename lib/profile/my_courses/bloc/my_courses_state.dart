

import '../../../common/entities/course.dart';

abstract class MyCoursesState {
  const MyCoursesState();
}


class InitialMyCoursesState extends MyCoursesState{
  const InitialMyCoursesState();
}

class LoadingMyCoursesStates extends MyCoursesState{
  const LoadingMyCoursesStates();
}

class DoneLoadingMyCoursesStates extends MyCoursesState{
  const DoneLoadingMyCoursesStates();
}



class LoadedMyCouresState extends MyCoursesState{
  const LoadedMyCouresState(this.courseItem);
  final List<CourseItem> courseItem;
}