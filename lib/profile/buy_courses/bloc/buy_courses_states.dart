import '../../../common/entities/course.dart';

abstract class BuyCoursesStates{
  const BuyCoursesStates();
}


class InitialBuyCoursesStates extends BuyCoursesStates{
  const InitialBuyCoursesStates();
}

class DoneLoadingBuyCoursesStates extends BuyCoursesStates{
  const DoneLoadingBuyCoursesStates();
}


class LoadingBuyCoursesStates extends BuyCoursesStates{
  const LoadingBuyCoursesStates();
}

class LoadedBuyCouresState extends BuyCoursesStates{
  final List<CourseItem> courseItem;
  LoadedBuyCouresState({required this.courseItem});
}
