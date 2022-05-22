import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AdminController extends GetxController {
  Stream<QuerySnapshot<Map<String, dynamic>>> streamAdmin() {
    return FirebaseFirestore.instance
        .collection("users")
        .where("role", isEqualTo: "admin")
        .snapshots();
  }

  void deleteAdmin(String uid) async {
    await FirebaseFirestore.instance.collection("users").doc(uid).delete();
    Get.defaultDialog(
        title: "Berhasil",
        middleText: "Telah Berhasil menghapus data admin",
        textConfirm: "OKAY",
        onConfirm: () {
          Get.back();
          Get.back();
        });
  }
}
