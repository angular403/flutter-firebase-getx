import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference products = firestore.collection("products");

    return products.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference products = firestore.collection("products");
    return products.orderBy("time", descending: true).snapshots();
  }

  void deleteProduct(String docId) {
    DocumentReference docRef = firestore.collection("products").doc(docId);
    try {
      Get.defaultDialog(
          title: "HAPUS DATA",
          middleText: "APAKAH KAMU YAKIN INGIN MENGHAPUS DATAI INI ?",
          textConfirm: "OKE",
          textCancel: "NO",
          onConfirm: () async {
            await docRef.delete();
            Get.back();
          });
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "TERJADI KESALAHAN",
        middleText: "TIDAK BERHASIL MENGHAPUS DATA !!",
      );
    }
  }
}
