import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidya_unity/common/routes/names.dart';
import 'package:vidya_unity/common/values/colors.dart';
import 'package:vidya_unity/common/widgets/common_widgets.dart';
import 'package:vidya_unity/course/course_datail/controller/course_detail_controller.dart';
import 'package:vidya_unity/course/course_datail/widgets/widgets.dart';

import 'bloc/course_detail_bloc.dart';
import 'bloc/course_detail_state.dart';

class CouseDetail extends StatefulWidget {
  const CouseDetail({super.key});

  @override
  State<CouseDetail> createState() => _CouseDetailState();
}

class _CouseDetailState extends State<CouseDetail> {

  late CourseDatailController _courseDatailController;

  @override
  void initState(){
    super.initState();
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    _courseDatailController = CourseDatailController(context: context);
    _courseDatailController.init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseDetailBloc,CourseDetailsState>(builder:(context,state){
      return state.courseItem ==null || state.videos ==null?SizedBox(height: 24.w,width: 24.w, child: const Center(child: CircularProgressIndicator())):Scaffold(
          appBar: courseAppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //thumbnail
                  thumbnail(image:state.courseItem!.isNotEmpty?state.courseItem![0].image??"":""),
                  SizedBox(height: 15.h,),

                  //three buttons
                  menuView(context,rating: state.courseItem!.isNotEmpty?state.courseItem![0].rating??0.0:0.0,state: state),
                  SizedBox(height: 15.h,),

                  //course title
                  reUsableText(text:state.courseItem!.isNotEmpty?state.courseItem![0].name??"":"",color: AppColors.primaryText,fontWeight:FontWeight.bold),

                  //course description
                  reUsableText(text:state.courseItem!.isNotEmpty? state.courseItem![0].description??"":"",fontSize:11),

                  //Go buy button
                  SizedBox(height: 11.h,),
                  PrimaryButtons(btnName: "Go Buy", btnType: "", onPress: (){
                    Navigator.of(context).pushNamed(AppRoutes.PAYMENT_WEB_VIEW,arguments: {
                      "url":"http://127.0.0.1:8000/auth/"
                    });
                  },btnTextColor: AppColors.primaryElementText),

                  //this course inclued
                  SizedBox(height: 11.h,),
                  reUsableText(text: "This course Includes",color: AppColors.primaryText,fontWeight: FontWeight.bold),

                  //course Summery
                  coruseSummery(state:state),
                  //List of Lessons

                  SizedBox(height: 11.h,),
                  reUsableText(text: "Lesson List",color: AppColors.primaryText,fontWeight: FontWeight.bold),
                  lessonList(state: state,context: context),
                ],
              ),
            ),
          )
      );
    } );
  }
}
