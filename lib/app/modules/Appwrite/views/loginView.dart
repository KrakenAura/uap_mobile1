// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:uap_mobile1/app/modules/Appwrite/controllers/AuthController.dart';
// import 'package:uap_mobile1/app/routes/app_pages.dart';
// import 'package:uap_mobile1/app/style.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   // final AuthController _accountController =
//   //     Get.put(AuthController());
//   final AuthController _accountController = AuthController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           onPressed: () {
//             Get.toNamed(Routes.HOME);
//           },
//           icon: const Icon(Icons.arrow_back),
//           color: orangeColor,
//         ),
//         title: Text(
//           'Login',
//           style: blackTextStyle2.copyWith(fontSize: 20),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             TextField(
//               controller: _passwordController,
//               obscureText: true,
//               decoration: InputDecoration(labelText: 'Password'),
//             ),
//             SizedBox(height: 16),
//             Obx(() {
//               return ElevatedButton(
//                 onPressed: _accountController.isLoading.value
//                     ? null
//                     : () {
//                         _accountController.loginAppWrite(
//                           _emailController.text,
//                           _passwordController.text,
//                         );
//                       },
//                 style: ElevatedButton.styleFrom(
//                     primary: orangeColor,
//                     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                     fixedSize: Size(150, 50)),
//                 child: _accountController.isLoading.value
//                     ? CircularProgressIndicator()
//                     : Text('Login'),
//               );
//             }),
//             SizedBox(height: 10),
//             Container(
//               width: 150,
//               height: 50,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Get.toNamed(Routes.REGISTER);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: orangeColor,
//                 ),
//                 child: Text(
//                   'Register',
//                   style: whiteTextStyle.copyWith(
//                       fontSize: 16, backgroundColor: orangeColor),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uap_mobile1/app/modules/Appwrite/controllers/auth_firebase_controller.dart';

import 'package:uap_mobile1/app/routes/app_pages.dart';
import 'package:uap_mobile1/app/style.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthFirebaseController _authController = AuthFirebaseController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
            Get.toNamed(Routes.HOME);
          },
          icon: const Icon(Icons.arrow_back),
          color: orangeColor,
        ),
        title: Text(
          'Login',
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
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                try {
                  await _authController.loginWithEmailAndPassword(
                    _emailController.text,
                    _passwordController.text,
                  );
                  // Navigate to the next screen on successful login
                  Get.toNamed(Routes.HOME);
                } catch (e) {
                  // Handle login error
                  print('Login failed: $e');
                }
              },
              style: ElevatedButton.styleFrom(
                primary: orangeColor,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                fixedSize: Size(150, 50),
              ),
              child: Text('Login'),
            ),
            SizedBox(height: 10),
            Container(
              width: 150,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.REGISTER);
                },
                style: ElevatedButton.styleFrom(
                  primary: orangeColor,
                ),
                child: Text(
                  'Register',
                  style: whiteTextStyle.copyWith(
                    fontSize: 16,
                    backgroundColor: orangeColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
