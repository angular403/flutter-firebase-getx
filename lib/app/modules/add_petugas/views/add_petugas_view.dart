import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_petugas_controller.dart';

class AddPetugasView extends GetView<AddPetugasController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ADD Petugas'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
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
            controller: controller.passC,
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
              controller.addPetugas(
                controller.nameC.text,
                controller.emailC.text,
                controller.passC.text,
              );
            },
            child: Icon(Icons.add),
            style: ElevatedButton.styleFrom(primary: Colors.red[900]),
          ),
        ],
      ),
    );
  }
}

