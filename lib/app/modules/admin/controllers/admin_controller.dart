import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AdminController extends GetxController {
  Stream<QuerySnapshot<Map<String, dynamic>>> streamAdmin() {
    return FirebaseFirestore.instance
        .collection("users")
        .where("role", isEqualTo: "admin")
        .snapshots();
  }

}
