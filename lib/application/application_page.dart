import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidya_unity/common/values/colors.dart';

import 'application_widgets.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color:AppColors.primaryElementText,
      child: SafeArea(
        child: Scaffold(
          body: Container(child: buildPage(_index)
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20.h),topRight: Radius.circular(20.h),),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                )
              ]
            ),
            width: 375.w,
            height: 60.h,
            child: BottomNavigationBar(
              currentIndex: _index,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: AppColors.primaryElement,
              unselectedItemColor: AppColors.primaryFourElementText,
              onTap: (value){
                setState(() {
                  _index = value;
                });
              },

              items: bottomBarsItem,
            ),
          )
        ),
      ),
    );
  }
}
