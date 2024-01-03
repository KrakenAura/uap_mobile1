import 'package:get/get.dart';
import 'package:uap_mobile1/app/modules/Appwrite/views/diff_page.dart';
import 'package:uap_mobile1/app/modules/Appwrite/views/game_hard_page.dart';
import 'package:uap_mobile1/app/modules/Appwrite/views/game_page.dart';
import 'package:uap_mobile1/app/modules/Appwrite/views/ig_view.dart';
import 'package:uap_mobile1/app/modules/Appwrite/views/local_leaderboard.dart';
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

  // static const INITIAL = Routes.HOME;
  // static const INITIAL = Routes.HOME;
  static const INITIAL = Routes.HOME;

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
        name: _Paths.GAME_EZ,
        page: () => GamePage(),
        binding: AppwriteBinding()),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfilePage(),
      binding: AppwriteBinding(),
    ),
    GetPage(
        name: _Paths.INSTAGRAM,
        page: () => InstagramView(),
        binding: AppwriteBinding()),
    GetPage(
        name: _Paths.DIFFICULTY,
        page: () => DifficultyView(),
        binding: AppwriteBinding()),
    GetPage(
        name: _Paths.GAME_HARD,
        page: () => GameHardPage(),
        binding: AppwriteBinding()),
    // GetPage(
    //     name: _Paths.LOCAL_LEADERBOARD,
    //     page: () => LeaderboardPage(leaderboardController: leaderboardControllerInstance,),
    //     binding: AppwriteBinding())
  ];
}
