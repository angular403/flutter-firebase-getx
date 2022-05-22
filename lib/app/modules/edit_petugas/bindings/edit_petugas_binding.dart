import 'package:get/get.dart';

import '../controllers/edit_petugas_controller.dart';

class EditPetugasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditPetugasController>(
      () => EditPetugasController(),
    );
  }
}
