import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vidya_unity/global.dart';

import 'MyCoursesController.dart';
import 'bloc/my_courses_bloc.dart';
import 'bloc/my_courses_state.dart';


class MyCoursers extends StatefulWidget {
  const MyCoursers({super.key});

  @override
  State<MyCoursers> createState() => _MyCoursersState();
}

class _MyCoursersState extends State<MyCoursers> {
  late MyCoursesController _myCoursesController;

  @override
  Future<void> didChangeDependencies() async {

    print(Global.storageService.getUserProfile());

    _myCoursesController = MyCoursesController(context: context);
    await _myCoursesController.Init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyCoursesBloc,MyCoursesState>(builder: (context,state){
      print("done loding the data..................");
      if(state is DoneLoadingMyCoursesStates){
        return Scaffold(
          appBar: AppBar(),
          body: Container(
            child: Center(child: Text("My Courses"),),
          ),
        );
      }else if(state is LoadedMyCouresState){
        print("just loaded my data");
       return Container();
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
