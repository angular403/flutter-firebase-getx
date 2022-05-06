import 'package:get/get.dart';
import 'package:flutter/material.dart';
class OtpController extends GetxController {
   TextEditingController otpC = TextEditingController();

  @override
  void onClose() {
    otpC.dispose();
    super.onClose();
  }

}
