

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vidya_unity/common/apis/user_api.dart';
import 'package:vidya_unity/common/entities/entities.dart';
import 'package:vidya_unity/register/bloc/register_bloc.dart';


class RegisterController{
  final  BuildContext context;
  RegisterController({required this.context});

  Future<void> Register()async {
    final state = context.read<RegisterBloc>().state;
    try{
     String FirstName = state.first_name.toString();
     String LastName = state.last_name.toString();
     String email = state.email.toString();
     String password = state.password.toString();
     String rePassword = state.re_password.toString();

     print("this is triggered");

     if(password==rePassword){
        RegisterEntity registerEntity = RegisterEntity();
        registerEntity.first_name = FirstName;
        registerEntity.last_name = LastName;
        registerEntity.email = email;
        registerEntity.password = password;

        UserAPI.register(params: registerEntity);
      }else{
       print("password did not match");
     }
    }catch(e){
      print("error $e");
    }
  }
}