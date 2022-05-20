import 'package:flutter/material.dart';
import 'package:flutter_firebase_getx/app/controllers/auth_controller.dart';
// import 'package:flutter_firebase_getx/app/routes/app_pages.dart';
// import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final authC = Get.find<AuthController>();
  // Class
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
              cursorColor: Colors.red,
              autocorrect: false,
              controller: controller.emailC,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              cursorColor: Colors.red,
              autocorrect: false,
              controller: controller.passC,
              obscureText: true,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: "Password",
                prefixIcon: Icon(Icons.key),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                authC.login(
                  controller.emailC.text,
                  controller.passC.text,
                );
              },
              icon: Icon(Icons.login),
              label: Text("LOGIN"),
            ),
           
          ],
        ),
      ),
    );
  }
}
