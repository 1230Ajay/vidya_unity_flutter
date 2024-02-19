import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vidya_unity/common/service/storage_service.dart';

import 'common/routes/bloc_obsever.dart';

class Global{
  static late StorageService storageService;

  static Future init() async{
    Bloc.observer = MyGlobalObserver();
    storageService = await StorageService().init();
  }

}