import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidya_unity/common/values/colors.dart';
import 'package:vidya_unity/common/values/constant.dart';
import 'package:vidya_unity/global.dart';
import 'package:vidya_unity/welcome/bloc/welcome_bloc.dart';
import 'package:vidya_unity/welcome/bloc/welcome_events.dart';

class welcomePage extends StatefulWidget {
  const welcomePage({super.key});

  @override
  State<welcomePage> createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
          return Scaffold(
            body: Container(
              margin: EdgeInsets.only(top: 34.h),
              width: 375.w,
              color: Colors.white,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (index){
                      setState(() {
                        context.read<WelcomeBloc>().add(PageEvent(page: index));
                      });
                    },
                    children: [
                      _page(
                          1,
                          context,
                          "next",
                          "First See Learning",
                          "Forget about a for of paper all knowledge in one learning",
                          "assets/images/reading.png"
                      ),
                      _page(
                          2,
                          context,
                          "next",
                          "Connect With Everyone ",
                          "Always keep in the touch with your tutor & freaind. lets get connected",
                          "assets/images/boy.png"
                      ),
                      _page(
                          3,
                          context,
                          "next",
                          "Always passionated learning",
                          "Anywhere, anytime. the time is at our disction study whenever you want",
                          "assets/images/man.png"
                      ),
                    ],
                  ),

                  Positioned(
                      bottom: 100.h,
                      child: DotsIndicator(
                        position: context.read<WelcomeBloc>().state.page,
                        dotsCount: 3,
                        mainAxisAlignment:MainAxisAlignment.center,
                        decorator: DotsDecorator(
                            color: AppColors.primaryThreeElementText,
                            activeColor: AppColors.primaryElement,
                            activeSize: const Size(18.0, 8.0),
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)
                            )
                        ),
                      )
                  )
                ],
              ),
            ),
          );
  }
  Widget _page(int index , BuildContext context ,String buttonName, String title , String subtitle , String imagePath){
    return Column(
      children: [
        SizedBox(height: 345.w,width: 345.w,child: Image.asset(imagePath,fit: BoxFit.cover,)),
        Text(title,style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.normal,color: AppColors.primaryText),),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Text(subtitle,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.normal,color: AppColors.primaryFourElementText),),
        ),
        Center(
          child: GestureDetector(
            onTap: ()async{
              if(index<3){
                //animation
                Global.storageService.setBools(key: AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, value: true);
                pageController.animateToPage(index, duration: const Duration(microseconds: 500), curve: Curves.easeIn);
              }else{
                Navigator.pushNamed(context, "sign_in");
              }
            },
            child: Container(
              width: 325.w,
              height: 50.h,
              margin: EdgeInsets.only(left: 25.w,top: 100.h,right: 25.w),
              decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  borderRadius: BorderRadius.all(Radius.circular(15.w)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset:const Offset(0,1)
                    )
                  ]
              ),
              child: Center(child: Text(buttonName,style:TextStyle(fontSize: 24.sp,fontWeight: FontWeight.bold,color: AppColors.primaryFourElementText),)),
            ),
          ),
        )
      ],
    );
  }
  }

