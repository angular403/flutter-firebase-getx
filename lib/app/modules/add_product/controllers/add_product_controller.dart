import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

///////////////////////////////////////
class AddProductController extends GetxController {
  late TextEditingController nameC;
  late TextEditingController priceC;

  // Instance
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // void add product
  void addProduct(String name, String price) async {
    CollectionReference products = firestore.collection("products");
    try {
      String dateNow = DateTime.now().toIso8601String();
      await products.add({
        "name": name,
        "price": price,
        "time":dateNow
      });
      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil Menambahkan Product",
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
        middleText: "Tidak Berhasil Menambahkan Product",
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
