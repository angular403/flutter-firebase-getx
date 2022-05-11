import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/movie_model.dart';

class EditMovieController extends GetxController {
  late TextEditingController titleC;
  late TextEditingController genreC;

  final moviesRef = FirebaseFirestore.instance
      .collection("movies")
      .withConverter<Movie>(
        fromFirestore: (snapshot, options) => Movie.fromJson(snapshot.data()!),
        toFirestore: (value, options) => value.toJson(),
      );


  // Get dataFuture<DocumentSnapshot<Movie>>
  Future<DocumentSnapshot<Movie>> getData(String docId) async {
    return  moviesRef.doc(docId).get();

  }

  // void edit Movies
  void editMovies(String title, String genre, String docID) async {
    var docData = moviesRef.doc(docID);
    try {
      String dateNow = DateTime.now().toIso8601String();

      await docData.update({
        "title": title,
        "genre": genre,
      });
      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil Mengupdate Movies",
        onConfirm: () {
          titleC.clear();
          genreC.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "TERJADI KESALAHAN",
        middleText: "Tidak Berhasil MENGUPDATE Movies",
      );
    }
  }

  @override
  void onInit() {
    titleC = TextEditingController();
    genreC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    titleC.dispose();
    genreC.dispose();
    super.onClose();
  }
}
