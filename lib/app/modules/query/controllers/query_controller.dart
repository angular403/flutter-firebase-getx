import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class QueryController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void filter(int age) async {
    final result = await firestore
        .collection("users")
        .orderBy("name")
        .startAt(["andrew"]).endAt(["robert"]).get();
    print(result.docs.length);

    if (result.docs.length > 0) {
      print("Total data Filter : ${result.docs.length}");
      result.docs.forEach((element) {
        var id = element.id;
        var data = element.data();

        print("ID : ${id}");
        print("DATA : ${data}");
      });
    } else {
      print("Tidak ada Total data pada Filter ini.");
    }
  }
}
