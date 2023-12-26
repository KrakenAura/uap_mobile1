import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:uap_mobile1/app/modules/Appwrite/controllers/AuthController.dart';
import 'package:uap_mobile1/app/routes/app_pages.dart';
import 'package:uap_mobile1/app/style.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthController _accountController =
      Get.put(AuthController()); // Updated controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.toNamed(Routes.LOGIN);
          },
          icon: const Icon(Icons.arrow_back),
          color: orangeColor,
        ),
        title: Text(
          'Register',
          style: blackTextStyle2.copyWith(fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 16),
            Obx(() {
              return ElevatedButton(
                onPressed: _accountController.isLoading.value
                    ? null
                    : () {
                        _accountController.registerAppWrite(
                          _emailController.text,
                          _passwordController.text,
                          _usernameController.text,
                        );
                      },
                style: ElevatedButton.styleFrom(
                    primary: orangeColor,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    fixedSize: Size(150, 50)),
                child: _accountController.isLoading.value
                    ? CircularProgressIndicator()
                    : Text('Register'),
              );
            }),
          ],
        ),
      ),
    );
  }
}
