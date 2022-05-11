import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../../data/models/movie_model.dart';

class MovieController extends GetxController {
  final moviesRef = FirebaseFirestore.instance
      .collection("movies")
      .withConverter<Movie>(
        fromFirestore: (snapshot, options) => Movie.fromJson(snapshot.data()!),
        toFirestore: (value, options) => value.toJson(),
      );

  Stream<QuerySnapshot<Movie>> streamMovie() {
    return moviesRef.snapshots();
  }

  void deleteMovie(String docID) async {
    await moviesRef.doc(docID).delete();
    Get.defaultDialog(
        title: "BERHASIL",
        middleText: "BERHASIL MENGHAPUS DATA INI.",
        textConfirm: "OKAY",
        onConfirm: () {
          Get.back();
          Get.back();
        });
  }
}
