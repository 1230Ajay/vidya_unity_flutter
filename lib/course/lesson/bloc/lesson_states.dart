import 'package:vidya_unity/common/entities/entities.dart';

import '../../../common/entities/course.dart';

class LessonStates {
  const LessonStates({

      this.lessonItem = const <VideoItem>[],
      this.isPlay = false,
      this.initializeVideoPlayerFuture});

      final List<VideoItem> lessonItem;
      final bool isPlay;
      final Future<void>? initializeVideoPlayerFuture;

  LessonStates copyWith({List<VideoItem>? lessonItem,bool? isPlay,Future<void>? initializeVideoPlayerFuture}) {
    return LessonStates(lessonItem: lessonItem ?? this.lessonItem,isPlay: isPlay??this.isPlay,initializeVideoPlayerFuture: initializeVideoPlayerFuture??this.initializeVideoPlayerFuture);
  }

}
