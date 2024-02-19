import '../../../common/entities/course.dart';
import '../../../common/entities/lesson.dart';

abstract class LessonEvents{
  const LessonEvents();
}

class TriggerLessonEvent extends LessonEvents{
  const TriggerLessonEvent({required this.lessonItem});
   final List<VideoItem> lessonItem;
}

class TriggerUrlItem extends LessonEvents{
  final Future<void>? initVideoPlayerFuture;
  const TriggerUrlItem({this.initVideoPlayerFuture});
}

class TriggerPlay extends LessonEvents{
  final bool isPlay;
  const TriggerPlay({required this.isPlay});
}