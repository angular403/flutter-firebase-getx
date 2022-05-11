import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_getx/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../../../data/models/movie_model.dart';
import '../controllers/movie_controller.dart';

class MovieView extends GetView<MovieController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home View'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.ADD_MOVIE);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot<Movie>>(
        stream: controller.streamMovie(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            var listAllDocs = snapshot.data!.docs;
            return ListView.builder(
                itemCount: listAllDocs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    
                    onTap: () {
                      Get.toNamed(Routes.EDIT_MOVIE,
                          arguments: listAllDocs[index].id);
                    },
                    title: Text("TITLE :  ${listAllDocs[index].data().title}"),
                    subtitle: Text("GENRE : ${listAllDocs[index].data().genre}"),
                    trailing: IconButton(
                      onPressed: () {
                        controller.deleteMovie(listAllDocs[index].id);
                      },
                      icon: Icon(Icons.delete),
                    ),
                  );
                });
          }
          return Center(
            child: CircularProgressIndicator(color: Colors.green),
          );
        },
      ),
    );
  }
}
