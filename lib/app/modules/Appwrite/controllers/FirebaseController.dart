import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:uap_mobile1/app/routes/app_pages.dart';

class FirebaseController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;

  Future<void> registerUser(String email, String password, String name) async {
    try {
      isLoading.value = true;
      UserCredential theUser = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await theUser.user?.updateDisplayName(name);
      Get.snackbar('Success', 'Registration successful',
          backgroundColor: Colors.green);
      //Navigate ke Login Page
      Get.toNamed(Routes.HOME);
    } catch (error) {
      Get.snackbar('Error', 'Registration failed: $error',
          backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loginUser(String email, String password) async {
    try {
      isLoading.value = true;
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar('Succes', 'Login Succes', backgroundColor: Colors.green);
      Get.toNamed(Routes.HOME);
    } catch (error) {
      Get.snackbar('Login Failed', 'Login failed : $error',
          backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }
}
