


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/routes/names.dart';
import '../../common/values/constant.dart';
import '../../global.dart';

AppBar SettingsAppBar(){
  return AppBar(
    title: Text("Settings"),
  );
}


Widget SettingsButton({required BuildContext context,void Function()? onPress}){
  return GestureDetector(
    onTap: (){
      showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          title: Text("Confirm Logout"),
          content: Text("Confirm Logout"),
          actions: [
            TextButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: Text("Cancel")),
            TextButton(onPressed:()=>onPress!()
            , child: Text("Confirm"))
          ],
        );
      });
    },
    child: Container(
      height: 100.w,
      decoration: BoxDecoration(
          image:  DecorationImage(
              image: AssetImage("assets/icons/Logout.png")
          )
      ),
    ),
  );
}