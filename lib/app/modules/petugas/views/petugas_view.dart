import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/petugas_controller.dart';

class PetugasView extends GetView<PetugasController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PetugasView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PetugasView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
