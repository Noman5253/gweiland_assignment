import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gweiland/modules/home/home_view.dart';
import 'package:gweiland/resources/app_routes.dart';
import 'package:gweiland/resources/app_strings.dart';
import 'package:gweiland/utils/bindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context1, child) {
        return GetMaterialApp(
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.grey,
          ),
          getPages: [
            GetPage(
                name: AppRoutes.home,
                page: () => const HomeView(),
                binding: HomeBinding())
          ],
          initialRoute: AppRoutes.home,
          // navigatorKey: locator<NavigationService>().navigatoryKey,
        );
      },
      designSize: const Size(375, 812),
    );
  }
}
