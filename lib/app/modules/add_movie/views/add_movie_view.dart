import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_movie_controller.dart';

class AddMovieView extends GetView<AddMovieController> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text('ADD MOVIE'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: controller.titleC,
             autocorrect: false,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: "MOVIE TITLE",
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: controller.genreC,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              labelText: "GENRE MOVIE",
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: () {
              controller.addMovies(
                  controller.titleC.text, controller.genreC.text);
            },
            icon: Icon(Icons.add),
            label: Text(
              "ADD MOVIE",
            ),
          ),
        ],
      ),
    );
  }
}
