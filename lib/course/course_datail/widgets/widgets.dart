

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidya_unity/common/values/colors.dart';
import 'package:vidya_unity/common/values/constant.dart';
import 'package:vidya_unity/common/widgets/common_widgets.dart';
import 'package:vidya_unity/course/course_datail/bloc/course_detail_state.dart';

import '../../../common/routes/names.dart';

AppBar courseAppBar(){
  return AppBar(
    title: Text("Course Details",style:TextStyle(fontSize: 16.sp,fontWeight: FontWeight.normal),),
  );
}


Widget thumbnail({required String image}){
  return  Container(
    margin: EdgeInsets.only(top:20.h),
    height: 190.h,
    decoration: BoxDecoration(
        image: DecorationImage(
            fit:BoxFit.fill,
            image: NetworkImage(image))
    ),
  );
}

Widget _courseButton(BuildContext context,CourseDetailsState state){
  return GestureDetector(
    onTap: ()=>Navigator.of(context).pushNamed(AppRoutes.INSTITUTE_PAGE,arguments: {
      "uid":state.courseItem![0].author
    }),
    child: Container(
      height: 32.h,
      padding: EdgeInsets.symmetric(horizontal:12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.w),
        color: AppColors.primaryElement
      ),
      child: Container(
        child: Center(
          child: Text("Auther page",style: TextStyle(color: AppColors.primaryElementText,fontWeight: FontWeight.bold),),
        ),
      ),
    ),
  );
}



Widget menuView(BuildContext context,{double people=0,double rating=0 ,required CourseDetailsState state}){
  return Container(
    height: 48.w,
    child: Row(
      children: [
         _courseButton(context,state),
         iconNum(iconPath:"assets/icons/people.png", num:people),
         iconNum(iconPath:"assets/icons/star.png", num:rating)
      ],
    ),
  );
}






Widget ListTile({required String image,required String title,required void Function() onPress}){

  return  GestureDetector(
    onTap: ()=>onPress(),
    child: Container(
      margin: EdgeInsets.only(top: 12.h),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.circular(8.w)
            ),
            padding: EdgeInsets.all(6.h),
            child: Image.asset("assets/icons/$image",height: 24.h,),
          ),
          Container(
              margin: EdgeInsets.only(left: 14.w),
              child: Text(title,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600,color:AppColors.primaryThreeElementText),)
          )
        ],
      ),
    ),
  );
}



Widget coruseSummery({required CourseDetailsState state}){
  List<Map<String,dynamic>> ProfileTileData= [
    {"image":"video_detail.png","title":"${state.courseItem![0].no_of_video} hours videos" },
    {"image":"file_detail.png","title":"Total ${state.courseItem![0].no_of_lessons} Lessons" },
    {"image":"download_detail.png","title":"${state.courseItem![0].no_of_resourse} download resourses" },
  ];

  return Container(
    // Adjust margin as needed
    child: ListView.builder(
      shrinkWrap: true, // Ensure the ListView takes only the space it needs
      physics: NeverScrollableScrollPhysics(), // Disable scrolling for the inner ListView
      itemCount: ProfileTileData.length,
      itemBuilder: (context, index) {
        return ListTile(
            image: ProfileTileData[index]["image"],
            title: ProfileTileData[index]["title"],
            onPress:(){
            }
        );
      },
    ),
  );
}

Widget lessonList({required CourseDetailsState state, required BuildContext context}){
  return SingleChildScrollView(
    child: ListView.builder(
        shrinkWrap: true,
        itemCount: state.videos!.length,itemBuilder: (context,index){
      return Container(
        height: 80.h,
        margin: EdgeInsets.only(top: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255,1),
            borderRadius: BorderRadius.circular(10.w),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: const Offset(0,.1)
              )
            ]
        ),
        child: InkWell(
          onTap: (){
            Navigator.of(context).pushNamed(AppRoutes.LESSON_DETAIL,arguments: {
              "index":index
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.h)
                    ),
                    child: Image(
                        width: 92.w,
                        height: 60.w,
                        fit: BoxFit.fill,
                        image: NetworkImage("${AppConstants.BASE_URL}${state.videos![index].thumbnail??" "}")),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _listContainr(text:state.videos![index].title??"",),
                      _listContainr(text:state.videos![index].description??"",color: AppColors.primaryThreeElementText,fontSize: 11)
                    ],
                  ),
                ],
              ),
              Container(
                child: Image(height: 24.w,width: 24.w,image: AssetImage("assets/icons/arrow_right.png"),),
              )
            ],
          ),
        ),
      );
    }),
  );
}


Widget _listContainr({required String text,Color color=AppColors.primaryText,int fontSize=13}){
  return Container(
      margin: EdgeInsets.only(left:8.w),
      width: 160.w,
      child: Text(text,style: TextStyle(color:color,fontSize:fontSize.sp,fontWeight: FontWeight.bold),overflow: TextOverflow.clip,maxLines: 1,));
}