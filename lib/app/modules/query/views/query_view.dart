import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/query_controller.dart';

class QueryView extends GetView<QueryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QueryView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                controller.filter(25);
              },
              child: Text(
                "Filter",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.red[900],
                fixedSize: Size(200, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
