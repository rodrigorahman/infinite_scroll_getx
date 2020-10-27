import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_getx/application/bindings/application_binding.dart';
import 'package:infinite_scroll_getx/modules/home/home_bindings.dart';
import 'package:infinite_scroll_getx/modules/home/view/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: ApplicationBinding(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      getPages: [
        GetPage(
          name: '/',
          binding: HomeBindings(),
          page: () => HomePage(Get.find()),
        ),
      ],
    );
  }
}
