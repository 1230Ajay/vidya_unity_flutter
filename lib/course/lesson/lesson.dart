import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import 'package:vidya_unity/common/entities/entities.dart';
import 'package:vidya_unity/common/values/colors.dart';
import 'package:vidya_unity/common/values/constant.dart';
import 'package:vidya_unity/common/widgets/common_widgets.dart';
import 'package:vidya_unity/course/lesson/bloc/lesson_bloc.dart';
import 'package:vidya_unity/course/lesson/bloc/lesson_events.dart';
import 'package:vidya_unity/course/lesson/bloc/lesson_states.dart';

import 'controller/lesson_controller.dart';

class LessonDetail extends StatefulWidget {
  const LessonDetail({super.key});

  @override
  State<LessonDetail> createState() => _LessonDetailState();
}

class _LessonDetailState extends State<LessonDetail> {
  late LessonController _lessonController;
  late int videoIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _lessonController = LessonController(context: context);
    _lessonController.int();
    context.read<LessonBloc>().add(TriggerUrlItem(initVideoPlayerFuture: null));
  }

  @override
  void dispose() {
    _lessonController.videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonBloc, LessonStates>(builder: (context, state) {
      return Scaffold(
          appBar: AppBar(),
          body: Container(
            color: Colors.white,
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20),
                  sliver: SliverToBoxAdapter(
                    child: Container(
                      child: Column(
                        children: [
                          //video preview
                          Container(
                            height: 200.h,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/icons/video.png"),
                                  fit: BoxFit.fitWidth),
                              borderRadius: BorderRadius.circular(12.h),
                            ),
                            child: FutureBuilder(
                              future: state.initializeVideoPlayerFuture,
                              builder: (context, snapsot) {
                                if (snapsot.connectionState ==
                                    ConnectionState.done) {
                                  return AspectRatio(
                                      aspectRatio: _lessonController
                                          .videoPlayerController!
                                          .value
                                          .aspectRatio,
                                      child: Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          VideoPlayer(_lessonController
                                              .videoPlayerController!),
                                          VideoProgressIndicator(
                                            (_lessonController
                                                .videoPlayerController!),
                                            allowScrubbing: true,
                                            colors: VideoProgressColors(
                                                playedColor:
                                                    AppColors.primaryElement),
                                          ),
                                        ],
                                      ));
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ),
                          ),
                          //video button
                          Container(
                            margin: EdgeInsets.only(top: 15.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //left button

                                GestureDetector(
                                  onTap: () {
                                    videoIndex = videoIndex - 1;

                                    if (videoIndex < 0) {
                                      videoIndex = 0;
                                      print("there is no previous video");
                                    } else {
                                      var videoItem = state.lessonItem
                                          .elementAt(videoIndex);
                                      _lessonController
                                          .playVideo(videoItem.video_file!);
                                    }
                                  },
                                  child: Container(
                                    child: Image.asset(
                                      "assets/icons/rewind-left.png",
                                      width: 24.w,
                                      height: 24.w,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),
                                //play and pause button
                                GestureDetector(
                                  onTap: () {
                                    //its allready playing
                                    if (state.isPlay) {
                                      _lessonController.videoPlayerController
                                          ?.pause();
                                      context
                                          .read<LessonBloc>()
                                          .add(TriggerPlay(isPlay: false));
                                    } else {
                                      _lessonController.videoPlayerController
                                          ?.play();
                                      context
                                          .read<LessonBloc>()
                                          .add(TriggerPlay(isPlay: true));
                                    }
                                  },
                                  child: state.isPlay
                                      ? Container(
                                          child: Image.asset(
                                              "assets/icons/pause.png",
                                              width: 24.w,
                                              height: 24.w),
                                        )
                                      : Container(
                                          child: Image.asset(
                                              "assets/icons/play-circle.png",
                                              width: 24.w,
                                              height: 24.w),
                                        ),
                                ),

                                SizedBox(
                                  width: 15.w,
                                ),

                                GestureDetector(
                                  onTap: () async {
                                    videoIndex = videoIndex + 1;

                                    if (videoIndex > state.lessonItem.length) {
                                      videoIndex = videoIndex - 1;
                                      print("there is no more video to play");
                                    } else {
                                      var videoItem = await state.lessonItem
                                          .elementAt(videoIndex);
                                      _lessonController
                                          .playVideo(videoItem.video_file!);
                                    }
                                  },
                                  child: Container(
                                    child: Image.asset(
                                      "assets/icons/rewind-right.png",
                                      width: 24.w,
                                      height: 24.w,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                          childCount: state.lessonItem.length,
                          (context, index) {
                        return buildLessonItem(
                            context, index, state.lessonItem[index]);
                      }),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 18.h, horizontal: 25.w))
              ],
            ),
          ));
    });
  }

  Widget buildLessonItem(BuildContext context, int index, VideoItem item) {
    return GestureDetector(
      onTap: (){
      videoIndex = index;
      _lessonController.playVideo(item.video_file!);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        height: 80.h,
        margin: EdgeInsets.only(bottom: 8.h),
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(8.w),
          boxShadow: [
            BoxShadow(
                color: Colors.green.withOpacity(.5),
                blurRadius: 3,
                spreadRadius: 2,
                offset: Offset(0, 1)),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 76.h,
                  height: 60.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.w),
                      image: DecorationImage(
                          image: NetworkImage(
                              "${AppConstants.BASE_URL}/${item.thumbnail!}"),
                          fit: BoxFit.fitHeight)),
                ),

                Container(
                  child: Column(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                      _listContainr(text:item.title!,),
                      _listContainr(text:item.description!,color: AppColors.primaryThreeElementText,fontSize: 11)
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: 15.w),
              child: Icon(Icons.play_arrow,size: 32.w,color: AppColors.primaryElement,),
            )
          ],
        ),
      ),
    );
  }
}



Widget _listContainr({required String text,Color color=AppColors.primaryText,int fontSize=13}){
  return Container(
      margin: EdgeInsets.only(left:8.w),
      width: 160.w,
      child: Text(text,style: TextStyle(color:color,fontSize:fontSize.sp,fontWeight: FontWeight.bold),overflow: TextOverflow.clip,maxLines: 1,));
}