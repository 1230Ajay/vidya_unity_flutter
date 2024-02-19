import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vidya_unity/common/entities/entities.dart';
import 'package:vidya_unity/common/values/constant.dart';

class StorageService{

  late final SharedPreferences _preferences;
  Future<StorageService> init()async{
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBools({required String key, required bool value}){
    return _preferences.setBool(key, value);
  }

  bool getBools({required String key}){
    return _preferences.getBool(key)??false;
  }

  Future<bool> setStrings({required String key, required String value}){
    return _preferences.setString(key, value);
  }

  String getStrings({required String key}){
    return _preferences.getString(key)??"";
  }

  Future<bool> remove({required String key}){
    return _preferences.remove(key);
  }

  String getUserProfile(){
    var profileOffline = _preferences.getString(AppConstants.USER_PROFILE_KEY)??"";
     return profileOffline;
  }

  String getUserAccessToken(){
    var userAccessToken = _preferences.getString(AppConstants.STORAGE_USER_ACCESS_TOKEN);
    return userAccessToken??"";
  }

  String getUserRefreshToken(){
    var userRefreshToken = _preferences.getString(AppConstants.STORAGE_USER_REFRESH_TOKEN);
    return userRefreshToken??"";
  }


}