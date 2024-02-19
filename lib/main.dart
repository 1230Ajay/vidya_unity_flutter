import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'common/routes/pages.dart';
import 'global.dart';


Future<void> main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppPages.allBlocProviders(context),
      child: ScreenUtilInit(
          designSize: const Size(375, 780),
          builder: (context, child) => MaterialApp(
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
                onGenerateRoute: AppPages.GenrageRouteSettings,
              )),
    );
  }
}
