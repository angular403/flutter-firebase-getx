import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_getx/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/admin_controller.dart';

class AdminView extends GetView<AdminController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Menu Admin'),
          centerTitle: true,
        ),
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: controller.streamAdmin(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.data!.docs.length != 0) {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var data = snapshot.data!.docs[index].data();
                    return ListTile(
                      title: Text("${data["name"]}"),
                      subtitle: Text("${data["email"]}"),
                    );
                  },
                );
              } else {
                return Center(
                  child: Text("TIDAK ADA DATA ADMIN"),
                );
              }
            }
            return Center(
              child: CircularProgressIndicator(color: Colors.red),
            );
          },
        ));
  }
}
