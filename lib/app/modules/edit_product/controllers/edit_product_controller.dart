import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class EditProductController extends GetxController {
  late TextEditingController nameC;
  late TextEditingController priceC;

  // Instance
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Get data
  Future<DocumentSnapshot<Object?>> getData(String docId) async {
    DocumentReference docRef = firestore.collection("products").doc(docId);
    return docRef.get();
  }

  // void EDIT product
  void editProduct(String name, String price, String docId) async {
    DocumentReference<Map<String, dynamic>> docData =
        firestore.collection("products").doc(docId);
    try {
      await docData.update({
        "name": name,
        "price": price,
      });
      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil Mengubah data Product",
        onConfirm: () {
          nameC.clear();
          priceC.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "TERJADI KESALAHAN",
        middleText: "Tidak Berhasil Mengubah data Product",
      );
    }
  }

  @override
  void onInit() {
    nameC = TextEditingController();
    priceC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameC.dispose();
    priceC.dispose();
    super.onClose();
  }
}
