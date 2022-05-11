import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/movie_model.dart';

class AddMovieController extends GetxController {
  late TextEditingController titleC;
  late TextEditingController genreC;

  final moviesRef = FirebaseFirestore.instance
      .collection("movies")
      .withConverter<Movie>(
        fromFirestore: (snapshot, options) => Movie.fromJson(snapshot.data()!),
        toFirestore: (value, options) => value.toJson(),
      );

  // void add Movies
  void addMovies(String title, String genre) async {
    try {
      String dateNow = DateTime.now().toIso8601String();
      await moviesRef.add(
        Movie(
          title: title,
          genre: genre,
        ),
      );
      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil Menambahkan Movies",
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
        middleText: "Tidak Berhasil Menambahkan Movies",
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
