import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidya_unity/common/values/constant.dart';
import 'package:vidya_unity/home/home.dart';
import 'package:vidya_unity/profile/profile.dart';
import 'package:vidya_unity/search/bloc/search_bloc.dart';

import '../common/routes/names.dart';
import '../common/values/colors.dart';
import '../search/search.dart';

Widget buildPage(int index){
    List<Widget> widget = [
      const HomePage(),
      BlocProvider<SearchBloc>(create: (context)=>SearchBloc(),child: const SearchPage(),),
      const Center(child: Text("Course")),
      const Center(child: Text("Chat")),
      const ProfilePage(),

  ];
    return widget[index];
}


var bottomBarsItem = [
  BottomNavigationBarItem(
      activeIcon:const Icon(Icons.home,size: 32,),
      label: "home",
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: const Icon(Icons.home,size: 32,),
      )),

  BottomNavigationBarItem(
      activeIcon:const Icon(Icons.search,size: 32,),
      label: "search",
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: const Icon(Icons.search,size: 32,),
      )),
  BottomNavigationBarItem(
      activeIcon:const Icon(Icons.play_arrow,size: 32,),
      label: "course",
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: const Icon(Icons.play_arrow,size: 32,),
      )),
  BottomNavigationBarItem(
      activeIcon:const Icon(Icons.chat,size: 32,),
      label: "chat",
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child:const Icon(Icons.chat,size: 32,),
      )),
  BottomNavigationBarItem(
      activeIcon:const Icon(Icons.person,size: 32,),
      label: "search",
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: const Icon(Icons.person,size: 32,),
      )),
];

Widget CircularLayoutAvatar({String? url, int radius=24}){
  return Container(
    child:url!=null?CircleAvatar(
      radius: radius.w,
      child:Image.network(url,fit: BoxFit.fitWidth,height: radius*2.w,width: radius*2.w,),
    ):CircleAvatar(
      radius: radius.w,
      child:Image.asset("assets/icons/person2.png",fit: BoxFit.fitHeight,height: radius.w,width: radius.w,),
    ),
  );
}

Widget ReusableCouresesList({required dynamic state, required BuildContext context,bool isMediaUrlFull=true}){
  return SingleChildScrollView(
    child: ListView.builder(
        shrinkWrap: true,
        itemCount: state.courseItem.length,itemBuilder: (context,index){
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
            Navigator.of(context).pushNamed(AppRoutes.COURSE_DATAIL,arguments: {
              "uid":state.courseItem[index].uid
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
                        image:isMediaUrlFull?NetworkImage("${state.courseItem[index].image??""}"):NetworkImage("${AppConstants.BASE_URL}/${state.courseItem[index].image??""}")),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _listContainr(text:state.courseItem[index].name??"",),
                      _listContainr(text:state.courseItem[index].description??"",color: AppColors.primaryThreeElementText,fontSize: 11)
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