import 'package:flutter/material.dart';
import 'package:flutter_firebase_getx/app/controllers/auth_controller.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignupView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
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
              controller: controller.passC,
              obscureText: true,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: "Password",
                prefixIcon: Icon(Icons.key),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                authC.signup(
                  controller.emailC.text,
                  controller.passC.text,
                );
              },
              icon: Icon(Icons.login),
              label: Text("DAFTAR "),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text("Sudah Punya Akun ?"),
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("LOGIN"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
