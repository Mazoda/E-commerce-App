import 'package:firebase/views/screens/AppRouter.dart';
import 'package:firebase/views/screens/SignUp.dart';
import 'package:firebase/views/screens/splach_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'firebase_options.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
          designSize: const Size(411.4, 891.42),
          minTextAdapt: true,
          builder: (context, child) {
            return  MaterialApp(
               navigatorKey: AppRoute.navkey,
              debugShowCheckedModeBanner: false,
              // localizationsDelegates: context.localizationDelegates,
              // supportedLocales: context.supportedLocales,
              // locale: context.locale,
              home: SplashScreen(),
            );
          });
  }
}
