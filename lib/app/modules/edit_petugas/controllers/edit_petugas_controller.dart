import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPetugasController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();

  Future<void> initData(String uid) async {
    final dataDoc = await firestore.collection("users").doc(uid).get();

    var data = dataDoc.data()!;

    emailC.text = data["email"];
    nameC.text = data["name"];
  }

  @override
  void onClose() {
    nameC.dispose();
    emailC.dispose();
    super.onClose();
  }

  void editPetugas(
    String uid,
    String name,
    String email,
  ) async {
    try {
      await firestore.collection("users").doc(uid).update({
        "name": name,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil Mengupdate Data",
          textConfirm: "OKAY",
          onConfirm: () {
            Get.back(); // close dialog
            Get.back(); // back
          });
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: e.toString(),
      );
    }
  }
}
