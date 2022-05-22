import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_getx/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  bool logout = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  late TextEditingController nameC;
  late TextEditingController emailC;
  late TextEditingController passC;

  void updateProfile(String name, String email, String pass) async {
    try {
      var uid = auth.currentUser!.uid;

      if (pass != "") {
        if (pass.length >= 6) {
          await auth.currentUser!.updatePassword(pass);
          logout = true;
        } else {
          throw "Password Kurang dari 6 Karakter";
        }
      }

      await firestore.collection("users").doc(uid).update({"name": name});

      Get.defaultDialog(
          title: "BERHASIL",
          middleText: "Berhasil Mengupdate Profile",
          textConfirm: "OKAY",
          onConfirm: () async {
            Get.back(); // close dialog
            await auth.signOut();
            Get.offAllNamed(Routes.LOGIN);
          });
    } catch (e) {
      Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: e.toString(),
          textConfirm: "OKAY",
          onConfirm: () {
            Get.back();
            Get.back();
          });
    }
  }

  void initData() async {
    var uid = auth.currentUser!.uid;
    var docSnapshot = await firestore.collection("users").doc(uid).get();

    var data = docSnapshot.data()!;

    nameC.text = data["name"];
    emailC.text = data["email"];
  }

  @override
  void onInit() {
    nameC = TextEditingController();
    emailC = TextEditingController();
    passC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameC.dispose();
    emailC.dispose();
    passC.dispose();
    super.onClose();
  }
}
