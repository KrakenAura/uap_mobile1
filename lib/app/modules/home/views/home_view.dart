import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uap_mobile1/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF90CAF9),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/logo_game_mobile.png',
                width: 400,
                height: 400,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.GAME);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0,
                      minimumSize: Size(200, 48),
                      padding: EdgeInsets.all(0)),
                  child: SizedBox(
                    width: 200,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.orange[300],
                          border: Border.all(
                            color: Colors.white,
                            width: 5.0,
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Play',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.LOGIN);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0,
                      minimumSize: Size(200, 48),
                      padding: EdgeInsets.all(0)),
                  child: SizedBox(
                    width: 200,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.orange[300],
                          border: Border.all(
                            color: Colors.white,
                            width: 5.0,
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Account',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.INSTAGRAM);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0,
                      minimumSize: Size(200, 48),
                      padding: EdgeInsets.all(0)),
                  child: SizedBox(
                    width: 200,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.orange[300],
                          border: Border.all(
                            color: Colors.white,
                            width: 5.0,
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Our IG',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
