import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/reset_password_controller.dart';
import 'package:flutter_firebase_getx/app/controllers/auth_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
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
            SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                authC.resetPassword(
                  controller.emailC.text,
                );
              },
              icon: Icon(Icons.login),
              label: Text("Reset"),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sudah Punya Akun ? "),
                TextButton(
                  onPressed: () => Get.back(),
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
