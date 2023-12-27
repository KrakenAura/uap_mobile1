import 'package:get/get.dart';
import 'package:uap_mobile1/app/modules/Appwrite/views/game_page.dart';
import 'package:uap_mobile1/app/modules/Appwrite/views/loginView.dart';
import 'package:uap_mobile1/app/modules/Appwrite/views/profile_page.dart';
import 'package:uap_mobile1/app/modules/Appwrite/views/registerView.dart';

import '../modules/Appwrite/bindings/appwrite_binding.dart';
import '../modules/Appwrite/views/appwrite_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.APPWRITE,
      page: () => const AppwriteView(),
      binding: AppwriteBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginPage(),
      binding: AppwriteBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterPage(),
      binding: AppwriteBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfilePage(),
      binding: AppwriteBinding(),
    ),
    GetPage(
        name: _Paths.GAME, page: () => GamePage(), binding: AppwriteBinding())
  ];
}
