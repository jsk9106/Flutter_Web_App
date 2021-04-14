import 'package:flutter/material.dart';
import 'package:flutter_web_app/screen/flutter.dart';
import 'package:get/get.dart';

import 'controller/screen_layout_controller.dart';
import 'screen/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialBinding: BindingsBuilder((){
        Get.put(ScreenLayoutController());
      }),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/flutter', page: () => FlutterScreen()),
      ],
    );
  }
}


