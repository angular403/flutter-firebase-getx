import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Profile'),
        centerTitle: true,
      ),
      body: ListView(
            padding: EdgeInsets.all(10),
            children: [
              TextField(
                readOnly: true,
                controller: controller.nameC,
                autocorrect: false,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "Update Your Name",
                  suffixIcon: Icon(
                    Icons.person,
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                readOnly: true,
                controller: controller.emailC,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    labelText: "email",
                    hintText: "Update Your Email",
                    suffixIcon: Icon(Icons.email)),
              ),
              SizedBox(height: 10),
              TextField(
                controller: controller.passC,
                autocorrect: false,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: "password",
                  hintText: "Update Your Password",
                  suffixIcon: Icon(Icons.lock),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  controller.updateProfile(
                    Get.arguments.toString(),
                    controller.nameC.text,
                    controller.emailC.text,
                  );
                },
                child: Text("Update Profile"),
                style: ElevatedButton.styleFrom(primary: Colors.red[900]),
                
              ),
            ],
          ),
    );
  }
}
