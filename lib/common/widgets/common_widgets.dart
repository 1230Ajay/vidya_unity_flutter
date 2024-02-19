import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidya_unity/common/values/colors.dart';

AppBar buildAppBar({required String type}) {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        height: 1.0,
        //hiegh defines to thickness of line
      ),
    ),
    title: Center(
        child: Text(
          type,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              color: AppColors.primaryText),
        )),
  );
}

//we need context for eccecing bloc
Widget buildThirdpartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
    padding: EdgeInsets.symmetric(horizontal: 25.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _reUsableIcons(iconName: "google"),
        _reUsableIcons(iconName: "apple"),
        _reUsableIcons(iconName: "facebook")
      ],
    ),
  );
}

Widget _reUsableIcons({
  required String iconName,
}) {
  return Container(
    child: GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: 40.w,
        height: 40.w,
        child: Image.asset("assets/icons/$iconName.png"),
      ),
    ),
  );
}

Widget reUsableText({required String text,Color color = AppColors.primaryFourElementText,FontWeight fontWeight=FontWeight.normal,int fontSize=14}) {
  return Container(
      margin: EdgeInsets.only(
        bottom: 5.h,
      ),
      child: Text(
        text,
        style: TextStyle(
            color: color,
            fontWeight: fontWeight,
            fontSize: fontSize.sp),
      ));
}

Widget buildTextField(
    {required String hintText,
      required String textType,
      required String text,
      required String IconName,
      required void Function(String value)? onPress
    }) {
  return Container(
    height: 50.h,
    decoration: BoxDecoration(

        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(15.w))),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            width: 24.w,
            height: 24.w,
            margin: EdgeInsets.symmetric(horizontal: 17.w),
            child: Image.asset("assets/icons/$IconName.png")),
        Container(
          width: 240.w,
          height: 50.h,
          margin: EdgeInsets.only(top: 4.h),
          child: TextField(
            onChanged: (value)=>onPress!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: hintText,
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              hintStyle: const TextStyle(color: AppColors.primaryFourElementText),
            ),
            autocorrect: false,
            obscureText: textType == "password" ? true : false,
            style: TextStyle(
                color: Colors.black, fontFamily: "Avenir", fontSize: 12.sp),
          ),
        )
      ],
    ),
  );
}

Widget textButton({String? text,required void Function() onPress,Color textColor = AppColors.primaryText}) {
  return Container(
    width: 260.w,
    height: 44.h,
    margin: EdgeInsets.only(left: 25.w, top: 16.h),
    child: GestureDetector(
      onTap: ()=>onPress(),
      child: Text(text!,
        style: TextStyle(
            color:textColor,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.primaryText),
      ),
    ),
  );
}

Widget PrimaryButtons({required String btnName, required String btnType,required Function() onPress,Color btnBackGroundColor = AppColors.primaryElement,Color btnTextColor = AppColors.primaryThreeElementText}) {
  return GestureDetector(
    onTap: ()=>onPress(),
    child: Container(
      height: 48.h,
      decoration: BoxDecoration(
          border: Border.all(
              color: btnType == "login"
                  ? Colors.transparent
                  : AppColors.primaryFourElementText),
          color: btnBackGroundColor,
          borderRadius: BorderRadius.all(Radius.circular(12.w))),
      child: Center(
        child: Text(
          btnName,
          style: TextStyle(
              color: btnTextColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}


Widget serachView({required String hintText,Function(String value)? onChange}) {
  return Container(
    height: 40.h,
    width: 280.w,
    decoration: BoxDecoration(
        color: AppColors.primaryBackground,
        border: Border.all(color: AppColors.primaryFourElementText),
        borderRadius: BorderRadius.circular(15.h)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(left: 12.w),
          width: 16.w,
          height: 16.w,
          child: Image.asset("assets/icons/search.png"),
        ),
        Container(
          width: 240.w,
          child: TextField(
            onChanged: (value)=>onChange!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(12, 5, 0, 5),
              hintText: hintText,
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              hintStyle:
              const TextStyle(color: AppColors.primaryFourElementText),
            ),
            autocorrect: false,
            style: TextStyle(
                color: Colors.black, fontFamily: "Avenir", fontSize: 12.sp),
          ),
        )
      ],
    ),
  );
}


Widget iconNum({required String iconPath, required double num,int space=20,int size=20}){
  return Container(
    margin: EdgeInsets.only(left: space.w),
    child: Row(
      children: [
        Image(
          height: size.h,
          width: size.w,
          image: AssetImage(iconPath),),
        SizedBox(width: 3,),
        Text(num.toString(),style: TextStyle(color: AppColors.primaryThreeElementText,fontWeight: FontWeight.bold,fontSize: 13.sp),),
      ],
    ),
  );
}