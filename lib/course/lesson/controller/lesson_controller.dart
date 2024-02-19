import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:vidya_unity/common/apis/course_api.dart';
import 'package:vidya_unity/common/entities/entities.dart';
import 'package:vidya_unity/common/values/constant.dart';
import 'package:vidya_unity/course/course_datail/bloc/course_detail_bloc.dart';
import 'package:vidya_unity/course/lesson/bloc/lesson_bloc.dart';

import '../bloc/lesson_events.dart';


class LessonController{
  BuildContext context;
  VideoPlayerController? videoPlayerController;
  LessonController({required this.context});

  void int(){
    final args =ModalRoute.of(context)!.settings.arguments as Map;
    context.read<LessonBloc>().add(TriggerPlay(isPlay: false));
    asyncLoadLessonData(args);
  }

  Future<void> asyncLoadLessonData(dynamic args) async {
      context.read<LessonBloc>().add(TriggerLessonEvent(lessonItem: context.read<CourseDetailBloc>().state.videos!));
      print("-------------------------------${context.read<CourseDetailBloc>().state.videos!.isNotEmpty}----------------------");
      if(context.read<CourseDetailBloc>().state.videos!.isNotEmpty){
        var url = "${AppConstants.BASE_URL}${context.read<CourseDetailBloc>().state.videos!.elementAt(args["index"]).video_file}";
        videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url));
        var initPlayer = videoPlayerController?.initialize();
        context.read<LessonBloc>().add(TriggerUrlItem(initVideoPlayerFuture:initPlayer!));
    }
    return;
  }
  
  void playVideo(String url){
    if(videoPlayerController!=null){
      videoPlayerController?.pause();
      videoPlayerController?.dispose();
    }
    
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url));
    context.read<LessonBloc>().add(TriggerPlay(isPlay: false));
    context.read<LessonBloc>().add(TriggerUrlItem(initVideoPlayerFuture: null));

    var initPlayer = videoPlayerController?.initialize().then((value){
      videoPlayerController?.seekTo(Duration(microseconds:0));
    });

    context.read<LessonBloc>().add(TriggerUrlItem(initVideoPlayerFuture: initPlayer));
    context.read<LessonBloc>().add(TriggerPlay(isPlay: true));
  }

}

