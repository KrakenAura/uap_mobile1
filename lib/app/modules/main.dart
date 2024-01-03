import 'package:firebase_core/firebase_core.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uap_mobile1/app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlameAudio.bgm.initialize();

  try {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        appId: '1:860817207908:android:2ad06647e96ac9cef3e571',
        apiKey: 'AIzaSyBcSrCdPbaEtaQ-D8-AFcrDP5_qwFBjw5A',
        messagingSenderId: '860817207908',
        projectId: 'mathriddle-2718c',
      ),
    );
  } catch (e) {
    print('Error initializing Firebase: $e');
  }

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
