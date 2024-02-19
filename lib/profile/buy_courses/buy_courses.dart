import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidya_unity/profile/buy_courses/bloc/buy_courses_bloc.dart';
import 'package:vidya_unity/profile/buy_courses/bloc/buy_courses_states.dart';
import 'package:vidya_unity/profile/buy_courses/buy_courses_controller.dart';
import 'package:vidya_unity/profile/buy_courses/widgets/buy_courses_widgets.dart';
import 'package:vidya_unity/profile/my_courses/bloc/my_courses_state.dart';

import '../../application/application_widgets.dart';

class BuyCourses extends StatefulWidget {
  const BuyCourses({super.key});

  @override
  State<BuyCourses> createState() => _BuyCoursesState();
}

class _BuyCoursesState extends State<BuyCourses> {
   late BuyCourseController _buyCourseController;


  @override
  void didChangeDependencies() {
    _buyCourseController = BuyCourseController(context: context);
    _buyCourseController.Init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuyCoursesBloc,BuyCoursesStates>(builder: (context,state){
      print("done loding the data..................");
      if(state is DoneLoadingBuyCoursesStates){
        return Scaffold(
          appBar: AppBar(),
          body: Container(

            child: Center(child: Text("Courses I baught"),),
          ),
        );
      }else if(state is LoadedBuyCouresState){
        print("just loaded my data");
        return Scaffold(
          appBar: AppBar(),
          body: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              child: ReusableCouresesList(state:state, context: context)),
        );
      }else{
        print("Data is being loaded");
        return Scaffold(
          appBar: AppBar(),
          body: Container(
            child: Center(child: CircularProgressIndicator(),),
          ),
        );
      }
    }
    );
  }
}
