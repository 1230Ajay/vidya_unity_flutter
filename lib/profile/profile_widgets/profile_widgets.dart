
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidya_unity/common/routes/names.dart';
import 'package:vidya_unity/common/values/colors.dart';
import 'package:vidya_unity/common/widgets/common_widgets.dart';
import 'package:vidya_unity/profile/bloc/profile_state.dart';

AppBar ProfileAppBar(){
  return AppBar(
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 18.w,height: 18.w,
          child: Image.asset("assets/icons/menu.png"),),
          Text("Profile",style: TextStyle(color:AppColors.primaryText,fontSize: 16.sp,fontWeight: FontWeight.bold),),
          SizedBox(width: 24.w,height: 24.w,
            child: Image.asset("assets/icons/more-vertical.png"),),
        ],
      ),
    ),
  );
}


Widget AvetarView({required String avatar}){
  return CircleAvatar(
    radius: 48.w,
    child: Container(
      alignment: Alignment.bottomRight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(48.w),
          image: DecorationImage(
              fit:BoxFit.fitHeight,
              image: NetworkImage(avatar)
          )
      ),
      child: Container(
        child: Image.asset("assets/icons/edit_3.png"),
      ),
    ),
  );
}

List<Map<String,dynamic>> ProfileTileData= [
  {"image":"settings.png","title":"Settings" },
  {"image":"credit-card.png","title":"Payment Details" },
  {"image":"award.png","title":"Achivements" },
  {"image":"heart(1).png","title":"Love" },
  {"image":"cube.png","title":"Reminders" }
];


Widget ListTile({required String image,required String title,required void Function() onPress}){
  return  GestureDetector(
    onTap: ()=>onPress(),
    child: Container(
      margin: EdgeInsets.only(top: 16.h),
      padding: EdgeInsets.only(left: 36.w),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.circular(8.w)
            ),
            height: 48.w,
            width:48.h,
            child: Image.asset("assets/icons/$image"),
          ),
          Container(
              margin: EdgeInsets.only(left: 14.w),
              child: Text(title,style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold),)
          )
        ],
      ),
    ),
  );
}

Widget listView({required BuildContext context}) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _UpperListElement(name: "My courses", iconPath:'profile_video.png',onPressed:(){
                Navigator.of(context).pushNamed(AppRoutes.MY_COURSES);
              }),
              SizedBox(width: 12,),
              _UpperListElement(name: "Buy courses", iconPath:'credit-card.png',onPressed: (){
                Navigator.of(context).pushNamed(AppRoutes.BUY_COURSES);
              }),
              SizedBox(width: 12,),
              _UpperListElement(name: "4.9", iconPath:'star.png',onPressed: (){})

            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 24), // Adjust margin as needed
          child: ListView.builder(
            shrinkWrap: true, // Ensure the ListView takes only the space it needs
            physics: NeverScrollableScrollPhysics(), // Disable scrolling for the inner ListView
            itemCount: ProfileTileData.length,
            itemBuilder: (context, index) {
              return ListTile(
                image: ProfileTileData[index]["image"],
                title: ProfileTileData[index]["title"],
                onPress:(){
                  if(index==0){
                    Navigator.pushNamed(context, AppRoutes.SETTINGS);
                  }else if(index==1){
                    Navigator.pushNamed(context, AppRoutes.PAYMENT_DETAILS);
                  }
                }
              );
            },
          ),
        ),
      ],
    ),
  );
}

Widget ProfileName(ProfileState state){
  return  Container(
      padding: EdgeInsets.symmetric(horizontal: 50.w),
      margin: EdgeInsets.only(top: 12.h),
      child: Text(state.profile?.username??"user name not available",style: TextStyle(color: AppColors.primaryText,fontWeight: FontWeight.normal,fontSize: 16.sp),overflow: TextOverflow.clip,)
  );
}

Widget _UpperListElement({required String name , required String iconPath, required Null Function() onPressed}){
  return GestureDetector(
    onTap: ()=>onPressed(),
    child: Container(
      width:108,
      height: 72,
      decoration:BoxDecoration(
          color: AppColors.primaryElement,
          borderRadius: BorderRadius.circular(12.w)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Image.asset( "assets/icons/"+iconPath,height:32,width: 32,color: AppColors.primaryElementText,),
          ),
          reUsableText(text:name,color: AppColors.primaryElementText,fontSize:11,fontWeight:FontWeight.bold)
        ],
      ),
    ),
  );
}