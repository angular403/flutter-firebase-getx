import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ADD PRODUCT'),
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
              labelText: "Product Name",
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: controller.priceC,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              labelText: "Product Price",
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: () {
              controller.addProduct(
                  controller.nameC.text, controller.priceC.text);
            },
            icon: Icon(Icons.add),
            label: Text(
              "ADD PRODUCT",
            ),
          ),
        ],
      ),
    );
  }
}
