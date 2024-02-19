import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidya_unity/common/entities/course.dart';
import 'package:vidya_unity/common/values/colors.dart';
import 'package:vidya_unity/common/values/constant.dart';
import 'package:vidya_unity/home/bloc/home_bloc.dart';
import 'package:vidya_unity/home/bloc/home_events.dart';
import 'package:vidya_unity/home/bloc/home_states.dart';

// Reusable App bar
AppBar HomeAppBar({required String avatar}) {
  return AppBar(
    backgroundColor: AppColors.primaryElementText,
    title: Container(
      margin: EdgeInsets.symmetric(horizontal: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 15.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          GestureDetector(
            onTap: () {
              // Handle the tap event here
              print("Container tapped!");
            },
            child: Container(
              width: 36.w,
              height: 36.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.w),
                image: DecorationImage(
                  // Replace AssetImage with NetworkImage
                  image: NetworkImage("${AppConstants.BASE_URL}${avatar}"),
                  fit: BoxFit.cover, // You can customize this property based on your needs
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

//Reusable home text
Widget homePageText(
    {required String text,
    Color color = AppColors.primaryThreeElementText,
    int top = 4}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold, color: color),
    ),
  );
}

Widget sliderContainer({required String add}) {
  return Container(
    constraints: BoxConstraints(
      maxWidth: 325,
      maxHeight: 156,
    ),
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(add),
      ),
    ),
  );
}

Widget sliderView(BuildContext context, HomePageState state) {
  return Column(
    children: [
      Container(
        constraints: BoxConstraints(
          maxWidth: 336,
          maxHeight: 156,
        ),
        child: PageView(
          onPageChanged: (value) {
            context.read<HomePageBloc>().add(SliderIndexEvent(index: value));
          },
          children: [
            sliderContainer(add: "assets/icons/Art.png"),
            sliderContainer(add: "assets/icons/Image(1).png"),
            sliderContainer(add: "assets/icons/Image(2).png"),
          ],
        ),
      ),
      Container(
        child: DotsIndicator(
          dotsCount: 3,
          position: state.index,
          decorator: DotsDecorator(
              color: AppColors.primaryThreeElementText,
              activeColor: AppColors.primaryElement,
              size: const Size.square(5.0),
              activeSize: const Size(17, 5.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0))),
        ),
      )
    ],
  );
}

Widget _subTitleText(
    {required String text,
    Color color = AppColors.primaryText,
    int fontSize = 16,
    FontWeight fontWeight = FontWeight.bold}) {
  return Container(
    child: Text(
      text,
      style: TextStyle(
          color: color, fontSize: fontSize.sp, fontWeight: fontWeight),
    ),
  );
}

Widget _toggleButtons({
  required String menuText,
  Color bgColor=AppColors.primaryElement,
  Color txtColor=AppColors.primaryElementText,
}) {
  return Container(
    margin: EdgeInsets.only(right: 20.w),
    decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(7.w),
        border: Border.all(color: bgColor)),
    child: _subTitleText(
        text: menuText,
        color: txtColor,
        fontWeight: FontWeight.normal,
        fontSize: 11),
    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
  );
}

Widget MenuView() {
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 25.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _subTitleText(text: "choose your course"),
            GestureDetector(
                onTap: () {},
                child: _subTitleText(
                    text: "See all",
                    color: AppColors.primaryThreeElementText,
                    fontSize: 12)),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Row(
          children: [
            _toggleButtons(menuText: "All"),
            _toggleButtons(menuText: "Popular",txtColor: AppColors.primaryThreeElementText,bgColor: AppColors.primaryElementText),
            _toggleButtons(menuText: "Newest",txtColor: AppColors.primaryThreeElementText,bgColor: AppColors.primaryElementText),
          ],
        ),
      )
    ],
  );

}


Widget CourseGrind(CourseItem item){
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(item.image!)
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding:EdgeInsets.only(
              left: 16.w
          ),
          child: Text(item.name??"",style: TextStyle(

              color:AppColors.primaryElementText,fontWeight: FontWeight.bold,fontSize: 11.sp
          ),
            maxLines: 1,
            overflow: TextOverflow.fade,
          ),
        ),
        SizedBox(height: 5.h,),
        Container(
          padding:EdgeInsets.only(
              bottom: 8.h,
              left: 16.w
          ),
          child: Text(item.description??"",style: TextStyle(

              color:AppColors.primaryElementText,fontWeight: FontWeight.bold,fontSize: 8.sp
          ),
            maxLines: 1,
            overflow: TextOverflow.fade,
          ),
        ),

      ],
    ),
  );
}
