import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/di/home_binding.dart';
import 'core/theme/app_theme.dart';
import 'domain/entities/property.dart';
import 'presentation/pages/home_page.dart';
import 'presentation/pages/detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Real Estate App',
      theme: appTheme(),
      initialBinding: HomeBinding(),
      getPages: [
        GetPage(
          name: '/home',
          page: () => const HomePage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/detail',
          page: () => DetailPage(property: Get.arguments as Property),
        ),

      ],
      initialRoute: '/home',
    );
  }
}