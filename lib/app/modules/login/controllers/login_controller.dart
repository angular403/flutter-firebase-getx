import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailC = TextEditingController();
  final passC = TextEditingController();

  @override
  void onClose() {
    // TODO: implement onClose
    emailC.dispose();
    passC.dispose();
    super.onClose();
  }
}
