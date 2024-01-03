import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uap_mobile1/app/routes/app_pages.dart';

class DifficultyView extends StatefulWidget {
  const DifficultyView({Key? key}) : super(key: key);

  @override
  _DifficultyViewState createState() => _DifficultyViewState();
}

class _DifficultyViewState extends State<DifficultyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[400],
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 8, right: 8, top: 70, bottom: 100),
                child: Text('Pilih tingkat kesulitan!',
                    style: TextStyle(
                        fontSize: 38,
                        fontFamily: 'Jua',
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.GAME_EZ);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0,
                      minimumSize: Size(180, 48),
                      padding: EdgeInsets.all(0)),
                  child: Container(
                    width: 180,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 58, 194, 0),
                      border: Border.all(
                        color: Colors.white,
                        width: 5.0,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Easy',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Jua',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 14), // Spasi antara dua container
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.GAME_HARD);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0,
                      minimumSize: Size(180, 48),
                      padding: EdgeInsets.all(0)),
                  child: Container(
                    width: 180,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 205, 0, 0),
                      border: Border.all(
                        color: Colors.white,
                        width: 5.0,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Hard',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Jua',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
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
