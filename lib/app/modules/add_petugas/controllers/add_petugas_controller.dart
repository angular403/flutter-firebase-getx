import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPetugasController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  /////////////////////////////////////////////////////
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  ///////////////////////////////////////////////////////////
  void addPetugas(String name, String email, String pass) async {
    try {
      UserCredential userAuth = await auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      await firestore.collection("users").doc(userAuth.user!.uid).set({
        "uid": userAuth.user!.uid,
        "name": name,
        "email": email,
        "role": "petugas"
      });

      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Telah Berhasil Menambahkan Petugas Baru",
          textConfirm: "OKAY",
          onConfirm: () {
            Get.back(); // close dialog
            Get.back(); // back to menu Petugas
            
          });
          
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: e.toString(),
      );
    }
  }

  @override
  void onClose() {
    nameC.dispose();
    emailC.dispose();
    passC.dispose();
    super.onClose();
  }
}
