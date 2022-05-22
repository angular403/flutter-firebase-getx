import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_getx/app/controllers/auth_controller.dart';
import 'package:flutter_firebase_getx/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/petugas_controller.dart';

class PetugasView extends GetView<PetugasController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Menu petugas'),
          centerTitle: true,
          actions: [
            if(authC.currentUser.value.role == "admin")
            IconButton(
              onPressed: () {
                Get.toNamed(Routes.ADD_PETUGAS);
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: controller.streamPetugas(),
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
                      trailing: (authC.currentUser.value.role == "admin") ? IconButton(
                        onPressed: () {
                          controller.deletePetugas(data["uid"]);
                        },
                        icon: Icon(
                          Icons.delete,
                        ),
                      ) : SizedBox(),
                    );
                  },
                );
              } else {
                return Center(
                  child: Text("TIDAK ADA DATA petugas"),
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
