import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_getx/app/data/models/movie_model.dart';

import 'package:get/get.dart';

import '../controllers/edit_movie_controller.dart';

class editMovieView extends GetView<EditMovieController> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('EDIT MOVIES'),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot<Movie?>>(
          future: controller.getData(Get.arguments),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var data = snapshot.data!.data()!;
              controller.titleC.text = data.title!;
              controller.genreC.text = data.genre!;
              return ListView(
                padding: EdgeInsets.all(20),
                children: [
                  TextField(
                    controller: controller.titleC,
                    autocorrect: false,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "EDIT movies Name",
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: controller.genreC,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      labelText: "Edit movies Genre",
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton.icon(
                    onPressed: () {
                      controller.editMovies(
                        controller.titleC.text,
                        controller.genreC.text,
                        Get.arguments,
                      );
                    },
                    icon: Icon(Icons.add),
                    label: Text(
                      "EDIT movies",
                    ),
                  ),
                ],
              );
            }
            return Center(
              child: CircularProgressIndicator(color: Colors.green),
            );
          }),
    );
  }
}
