import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidya_unity/common/entities/entities.dart';
import 'package:vidya_unity/common/routes/names.dart';
import 'package:vidya_unity/common/values/colors.dart';
import 'package:vidya_unity/global.dart';
import 'package:vidya_unity/home/bloc/home_bloc.dart';
import 'package:vidya_unity/home/bloc/home_states.dart';
import 'package:vidya_unity/home/controller/home_controller.dart';
import 'package:vidya_unity/home/widgets/home_widgets.dart';
import 'package:vidya_unity/profile/bloc/profile_bloc.dart';
import 'package:vidya_unity/profile/bloc/profile_event.dart';

import '../common/widgets/common_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController _homeController;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var profile = Global.storageService.getUserProfile();

    Map<String, dynamic> profileData = jsonDecode(profile);


    UserItem profile_data = UserItem(username: profileData["username"],email: profileData["email"],is_institute_manager:profileData["is_institute_manager"],is_student:profileData["is_student"],is_tutor: profileData["is_tutor"],avatar:profileData["avatar"]);
    context.read<ProfileBloc>().add(TriggerProfile(profile: profile_data));

    return Scaffold(
      appBar: HomeAppBar(avatar: profile_data.avatar!),
      body:RefreshIndicator(
        onRefresh: (){
        return HomeController(context: context).init();
        },
        child:  BlocBuilder<HomePageBloc, HomePageState>(
          builder: (context, state) {

            if(state.courses!.isEmpty){
              HomeController(context: context).init();
            }

            return Container(
              color: AppColors.primaryElementText,
              margin: EdgeInsets.symmetric(horizontal: 25.w),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: homePageText(text: "Hello", top: 24),
                  ),


                  SliverToBoxAdapter(
                    child: homePageText(
                        text: "${profile_data.username}",
                        color: AppColors.primaryText),
                  ),


                  SliverToBoxAdapter(
                    child: Container(
                        margin: EdgeInsets.only(top: 24.h), child: serachView(hintText: "Search")),
                  ),


                  SliverToBoxAdapter(
                    child: Container(
                        margin: EdgeInsets.only(top: 20.h),
                        child: sliderView(context, state)),
                  ),


                  SliverToBoxAdapter(
                    child: Container(
                      child: MenuView(),
                    ),
                  ),


                  SliverPadding(
                    padding: EdgeInsets.symmetric(vertical: 18.h),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 6.w,
                          mainAxisSpacing: 6.w,
                          childAspectRatio: 1.6),
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return GestureDetector(
                          onTap: () async {
                            Navigator.of(context)
                                .pushNamed(AppRoutes.COURSE_DATAIL, arguments: {
                              "uid": state.courses?.elementAt(index).uid
                            });
                          },
                          child: CourseGrind(state.courses![index]),
                        );
                      }, childCount: state.courses?.length),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
