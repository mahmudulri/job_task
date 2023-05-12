import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_task/home_view.dart';

import 'base_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Job Task',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BaseView());
  }
}
