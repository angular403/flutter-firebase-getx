import 'package:flutter/material.dart';
import 'package:flutter_firebase_getx/app/controllers/auth_controller.dart';
import 'package:flutter_firebase_getx/app/routes/app_pages.dart';
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
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Get.toNamed(Routes.RESET_PASSWORD);
                },
                child: Text(
                  "FORGOT PASSWORD ?",
                ),
              ),
            ),
            SizedBox(height: 30),
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
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Belum Punya Akun ? "),
                TextButton(
                  onPressed: () => Get.toNamed(Routes.SIGNUP),
                  child: Text("Daftar Sekarang"),
                ),
              ],
            ),
            Divider(color: Colors.black),
            SizedBox(height: 20),
            TextField(
              controller: controller.phoneC,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: "PHONE NUMBER",
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                authC.loginPhone(controller.phoneC.text);
              },
              icon: Icon(Icons.login),
              label: Text("SEND OTP"),
            ),
            SizedBox(height: 10),
            Divider(color: Colors.black),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                authC.loginGoogle();
              },
              child: Text("LOGIN WITH GOOGLE"),
              style: ElevatedButton.styleFrom(
                primary: Colors.red[900],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
