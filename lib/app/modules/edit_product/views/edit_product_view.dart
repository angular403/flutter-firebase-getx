import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_product_controller.dart';

class EditProductView extends GetView<EditProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EDIT PRODUCT'),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
          future: controller.getData(Get.arguments),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var data = snapshot.data!.data() as Map<String, dynamic>;
              controller.nameC.text = data["name"];
              controller.priceC.text = data["price"];
              return ListView(
                padding: EdgeInsets.all(20),
                children: [
                  TextField(
                    controller: controller.nameC,
                    autocorrect: false,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "EDIT Product Name",
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: controller.priceC,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      labelText: "Edit Product Price",
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton.icon(
                    onPressed: () {
                      controller.editProduct(
                        controller.nameC.text,
                        controller.priceC.text,
                        Get.arguments,
                      );
                    },
                    icon: Icon(Icons.add),
                    label: Text(
                      "EDIT PRODUCT",
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
