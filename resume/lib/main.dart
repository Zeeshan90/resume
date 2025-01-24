import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume/app_routes.dart';
import 'package:resume/resume/resume.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setUrlStrategy(PathUrlStrategy());

  runApp(const MyResumeApp());
}

class MyResumeApp extends StatelessWidget {
  const MyResumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Introduction',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: ResumePage(),
      getPages: AppRoutes.pages,
      initialRoute: '/resume',
    );
  }
}

