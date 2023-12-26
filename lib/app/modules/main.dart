import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:uap_mobile1/app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
