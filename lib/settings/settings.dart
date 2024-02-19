import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vidya_unity/common/routes/names.dart';
import 'package:vidya_unity/common/values/constant.dart';
import 'package:vidya_unity/global.dart';
import 'package:vidya_unity/home/bloc/home_bloc.dart';
import 'package:vidya_unity/home/bloc/home_events.dart';
import 'package:vidya_unity/settings/widgets/settings_widgets.dart';

class  SettingsPage extends StatefulWidget {
  const  SettingsPage({super.key});

  @override
  State< SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State< SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingsAppBar(),
      body: SettingsButton(
          context: context,onPress: (){
          Global.storageService.remove(key: AppConstants.STORAGE_USER_ACCESS_TOKEN);
          Global.storageService.remove(key: AppConstants.STORAGE_USER_REFRESH_TOKEN);
          Global.storageService.remove(key: AppConstants.USER_PROFILE_KEY);
          Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
          context.read<HomePageBloc>().add(const SliderIndexEvent(index: 0));
      }),
    );
  }
}
