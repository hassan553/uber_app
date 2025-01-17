import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uber_app/core/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:uber_app/core/services/cache/cash_helper.dart';
import 'package:uber_app/core/services/firebase/awesome_notifications_helper.dart';
import 'package:uber_app/core/services/firebase/fcm_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FcmHelper.initFcm();
  await AwesomeNotificationsHelper.init();
  await CashHelper.init();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.splash,
      routes: routes,
    );
  }
}
