import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController phoneC = TextEditingController();

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    phoneC.dispose();
    super.onClose();
  }
}
