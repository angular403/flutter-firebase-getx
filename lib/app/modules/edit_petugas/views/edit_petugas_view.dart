import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_petugas_controller.dart';

class EditPetugasView extends GetView<EditPetugasController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EDIT Petugas'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: controller.initData(Get.arguments.toString()),
        builder: (context, snapshot) {
          return ListView(
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
                  hintText: "Your Name",
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
                    hintText: "Input Your Email",
                    suffixIcon: Icon(Icons.email)),
              ),
              SizedBox(height: 10),
              TextField(
                autocorrect: false,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: "password",
                  hintText: "Input Your Password",
                  suffixIcon: Icon(Icons.lock),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  controller.editPetugas(
                    Get.arguments.toString(),
                    controller.nameC.text,
                    controller.emailC.text,
                  );
                },
                child: Icon(Icons.add),
                style: ElevatedButton.styleFrom(primary: Colors.red[900]),
              ),
            ],
          );
        }
      ),
    );
  }
}
