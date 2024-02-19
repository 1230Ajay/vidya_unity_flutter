import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:vidya_unity/common/entities/entities.dart';
import 'package:vidya_unity/common/routes/names.dart';
import 'package:vidya_unity/common/values/constant.dart';
import 'package:vidya_unity/common/widgets/flutter_toast.dart';
import 'package:vidya_unity/global.dart';
import 'package:vidya_unity/home/controller/home_controller.dart';
import 'package:vidya_unity/sign_in/bloc/sign_in_bloc.dart';

import '../common/apis/user_api.dart';

class SignInController{

  final  BuildContext context;
  SignInController({required this.context});

  Future<void> SignIn()async {
    final state = context.read<SignInBloc>().state;
    try{

      LoginEntity loginEntity = LoginEntity();
      loginEntity.email =state.email;
      loginEntity.password =state.password;

      await asyncPostAllData(loginEntity);

      if(context.mounted){
        await HomeController(context: context).init();
      }

    }catch(e){
      print("error $e");
    }

  }

  Future<void> asyncPostAllData(LoginEntity loginEntity) async {

    var res = await UserAPI.login(params:loginEntity);

    try{
      if(res.code==200){
        String token = res.data["access"];
        Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
        Global.storageService.setStrings(key: AppConstants.USER_PROFILE_KEY, value:jsonEncode( decodedToken));
        Global.storageService.setStrings(key:AppConstants.STORAGE_USER_ACCESS_TOKEN,value: res.data["access"]);
        Global.storageService.setStrings(key: AppConstants.STORAGE_USER_REFRESH_TOKEN, value: res.data["refresh"]);
        Navigator.pushNamedAndRemoveUntil(context, AppRoutes.APPLICATION, (route) => false);
      }else{
        toastInfo(msg: "Credential not Found!");
      }
    }catch(e){
      print("error is there $e");
    }

  }

}