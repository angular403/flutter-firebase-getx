import 'package:flutter/material.dart';
import 'package:flutter_firebase_getx/app/controllers/auth_controller.dart';

import 'package:get/get.dart';

import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OtpView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
              controller: controller.otpC,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: "OTP",
                prefixIcon: Icon(Icons.sms),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                authC.loginOtp(
                  controller.otpC.text,
                  Get.arguments.toString(),
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
