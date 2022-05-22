import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PetugasController extends GetxController {
  Stream<QuerySnapshot<Map<String, dynamic>>> streamPetugas() {
    return FirebaseFirestore.instance
        .collection("users")
        .where("role", isEqualTo: "petugas")
        .snapshots();
  }

  void deletePetugas(String uid) async {
    await FirebaseFirestore.instance.collection("users").doc(uid).delete();
    Get.defaultDialog(
        title: "Berhasil",
        middleText: "Telah Berhasil menghapus data Petugas",
        textConfirm: "OKAY",
        onConfirm: () {
          Get.back();
          Get.back();
        });
  } 
}
