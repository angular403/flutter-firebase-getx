import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailC = TextEditingController(text: "test@gmail.com");
  final passC = TextEditingController(text: "123456");

  @override
  void onClose() {
    // TODO: implement onClose
    emailC.dispose();
    passC.dispose();
    super.onClose();
  }
}
