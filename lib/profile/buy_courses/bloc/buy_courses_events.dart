import 'package:vidya_unity/common/entities/course.dart';

abstract class BuyCoursesEvents{
  const BuyCoursesEvents();
}


class TriggerInitialBuyCoursesEvents extends BuyCoursesEvents{
  const TriggerInitialBuyCoursesEvents();
}

class TriggerDoneLoadingBuyCoursesEvents extends BuyCoursesEvents{
  const TriggerDoneLoadingBuyCoursesEvents();
}


class TriggerLoadingBuyCoursesEvents extends BuyCoursesEvents{
  const TriggerLoadingBuyCoursesEvents();
}


class TriggerLoadedBuyCouresEvents extends BuyCoursesEvents{
  const TriggerLoadedBuyCouresEvents(this.courseItem);
  final List<CourseItem> courseItem;
}