import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidya_unity/common/routes/names.dart';
import 'package:vidya_unity/common/values/colors.dart';
import 'package:vidya_unity/register/bloc/register_bloc.dart';
import 'package:vidya_unity/register/bloc/register_controller.dart';
import 'package:vidya_unity/register/bloc/register_events.dart';
import '../common/widgets/common_widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(type: "Sign Up"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h,),
            Center(child: reUsableText(text: "Enter your detail and free sign up")),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              margin: EdgeInsets.only(top: 36.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  reUsableText(text: "First name"),
                  buildTextField(textType: "name", text: "First name",hintText: "Enter your First name",IconName: "user",onPress: (value){
                    context.read<RegisterBloc>().add(FirstNameEvent(value));
                  }),
                  SizedBox(height: 20.h,),

                  reUsableText(text: "Last name"),
                  buildTextField(textType: "name", text: "Last Name",hintText: "Enter your Last name",IconName: "user",onPress: (value){
                    context.read<RegisterBloc>().add(LastNameEvent(value));
                  }),
                  SizedBox(height: 20.h,),

                  reUsableText(text: "Email"),
                  buildTextField(textType: "email", text: "Email",hintText: "Enter your Email Adress",IconName: "email",onPress: (value){
                    context.read<RegisterBloc>().add(EmailEvent(value));
                  }),
                  SizedBox(height: 20.h,),

                  reUsableText(text: "Password"),
                  buildTextField(textType: "password", text: "Password",hintText: "Enter your Password",IconName: "lock",onPress: (value){
                    context.read<RegisterBloc>().add(PasswordEvent(value));
                  }),
                  SizedBox(height: 20.h,),

                  reUsableText(text: "Confirm Password"),
                  buildTextField(textType: "password", text: "Password2",hintText: "Re-enter your Password",IconName: "lock",onPress: (value){
                    context.read<RegisterBloc>().add(RePasswordEvent(value));
                  }),

                ],
              ),
            ),
            SizedBox(height: 40.h,),
            SizedBox(height: 20.h,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25.h),
              child: PrimaryButtons(btnName: "Sign Up",btnType: "Sign Up",onPress: (){
                RegisterController(context: context).Register();
              }),
            ),
            textButton(text: "all-readry have account", onPress: (){
              Navigator.of(context).pushNamed(AppRoutes.SIGN_IN);
            },textColor: AppColors.primaryElement),
          ],
        ),
      ),
    );
  }
}
