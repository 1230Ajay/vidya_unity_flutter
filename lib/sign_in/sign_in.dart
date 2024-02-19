import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidya_unity/common/routes/names.dart';
import 'package:vidya_unity/common/values/colors.dart';
import 'package:vidya_unity/sign_in/bloc/sign_in_bloc.dart';
import 'package:vidya_unity/sign_in/sign_in_controller.dart';
import 'package:vidya_unity/sign_in/bloc/sign_in_events.dart';

import '../common/widgets/common_widgets.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(type: "Log In"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildThirdpartyLogin(context),

            Center(child: reUsableText(text: "Or use your email account to login")),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              margin: EdgeInsets.only(top: 36.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  reUsableText(text: "Email"),
                  buildTextField(textType: "email", text: "Email",hintText: "Enter your Email Adress",IconName: "user",onPress: (value){
                    context.read<SignInBloc>().add(EmailEvent(email: value));
                  }),
                  SizedBox(height: 20.h,),
                  reUsableText(text: "Password"),
                  buildTextField(textType: "password", text: "Password",hintText: "Enter your Password",IconName: "lock",onPress: (value){
                    context.read<SignInBloc>().add(PasswordEvent(password: value));
                  })
                ],
              ),
            ),
            textButton(text: "Forgot password",onPress: (){}),

            SizedBox(height: 40.h,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25.h),
              child: PrimaryButtons(btnName: "Log In",btnType: "login",onPress: (){
                SignInController(context: context).SignIn();
              }),
            ),
            SizedBox(height: 20.h,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25.h),
              child: PrimaryButtons(btnBackGroundColor: AppColors.primaryElementText,btnTextColor: AppColors.primaryText,btnName: "Sign Up",btnType: "Sign Up",onPress: (){
                Navigator.pushNamedAndRemoveUntil(context,AppRoutes.REGISTER, (route) => false);
              }),
            )
          ],
        ),
      ),
    );
  }
}
