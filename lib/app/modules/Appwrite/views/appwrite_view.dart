import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/appwrite_controller.dart';

class AppwriteView extends GetView<AppwriteController> {
  const AppwriteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppwriteView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AppwriteView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
