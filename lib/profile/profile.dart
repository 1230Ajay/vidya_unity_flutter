import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidya_unity/common/values/colors.dart';
import 'package:vidya_unity/common/values/constant.dart';
import 'package:vidya_unity/profile/bloc/profile_bloc.dart';
import 'package:vidya_unity/profile/bloc/profile_state.dart';
import 'package:vidya_unity/profile/profile_widgets/profile_widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc,ProfileState>(builder: (context,state){
      return Scaffold(
        appBar: ProfileAppBar(),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 48.w),
            width: 375.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AvetarView(avatar:"${AppConstants.BASE_URL}${state.profile?.avatar}"),
                ProfileName(state),
                listView(context:context),
              ],
            ),
          ),
        ),
      );
    });
  }
}
