import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodmenuorder/binding/all_controller_binding.dart';
import 'package:foodmenuorder/constants/app_constants.dart';
import 'package:foodmenuorder/screens/user/tabs/app.dart';
import 'package:foodmenuorder/screens/user/tabs/dashboard.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(414, 849),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppConstants.APP_NAME,
            initialBinding: AllControllerBinding(),
            theme: ThemeData(
              primaryColor: const Color(0xFFFF6666),
            ),
            home: const DashBoard(),
          );
        });
  }
}
