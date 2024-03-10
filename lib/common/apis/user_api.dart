import 'package:vidya_unity/common/entities/entities.dart';
import 'package:vidya_unity/common/values/constant.dart';
import 'package:vidya_unity/global.dart';

import '../utils/http_utils.dart';

class UserAPI{
 static login({LoginEntity? params}) async {
    var res = await HttpUtil().post(
      path: 'auth/',
      data:params?.toJson()
    );
    print(res);
  return UserLoginResponseEntity.fromJson(code: res.statusCode!, data: res.data);
  }

 static register({RegisterEntity? params}) async {
   var res = await HttpUtil().post(
       path: 'auth/register_account/',
       data:params?.toJson(),

   );
 }
 
}
