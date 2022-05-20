// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_getx/app/controllers/auth_controller.dart';
import 'package:flutter_firebase_getx/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.PROFILE);
            },
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: Column(
        children: [
          menuItem(
              title: "DATA ADMIN",
              imageURL: "https://picsum.photos/id/870/1500"),
          menuItem(
              title: "DATA PETUGAS",
              imageURL: "https://picsum.photos/id/872/1500"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.logout),
        onPressed: () {
          authC.logout();
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class menuItem extends StatelessWidget {
  menuItem({
    Key? key,
    required this.title,
    required this.imageURL,
  }) : super(key: key);

  String title;
  String imageURL;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (title == "DATA ADMIN") {
          Get.toNamed(Routes.ADMIN);
        } else {
          Get.toNamed(Routes.PETUGAS);
        }
      },
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(10),
        width: Get.width,
        height: Get.width * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image:
              DecorationImage(image: NetworkImage(imageURL), fit: BoxFit.cover),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
