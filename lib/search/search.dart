import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidya_unity/common/values/colors.dart';
import 'package:vidya_unity/common/widgets/common_widgets.dart';
import 'package:vidya_unity/search/bloc/search_bloc.dart';
import 'package:vidya_unity/search/bloc/search_events.dart';
import 'package:vidya_unity/search/bloc/search_states.dart';
import 'package:vidya_unity/search/search_controller.dart';

import '../common/routes/names.dart';
import '../common/values/constant.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchState();
}

class _SearchState extends State<SearchPage> {
  late MySearchController _searchController;

  @override
  void didChangeDependencies() {
    _searchController = MySearchController(context:context);
    _searchController.init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc,SearchStates>(builder: (context,state){
      return Scaffold(
        appBar: AppBar(title: reUsableText(text: "Search",color: AppColors.primaryText),),
        body: Container(
          margin: EdgeInsets.only(left: 24,right: 24,top: 12),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  child: serachView(hintText: 'Courses you might like',onChange: (value){
                    context.read<SearchBloc>().add(TriggerSearchEventItem(searchItem: value));
                    _searchController.init();
                  }),
                ),
              ),

              SliverToBoxAdapter(
                child: SingleChildScrollView(
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
                                      image: NetworkImage("${state.courseItem[index].image??" "}")),
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
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  Widget _listContainr({required String text,Color color=AppColors.primaryText,int fontSize=13}){
    return Container(
        margin: EdgeInsets.only(left:8.w),
        width: 160.w,
        child: Text(text,style: TextStyle(color:color,fontSize:fontSize.sp,fontWeight: FontWeight.bold),overflow: TextOverflow.clip,maxLines: 1,));
  }
}
