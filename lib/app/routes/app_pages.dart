import 'package:get/get.dart';
import 'package:flutter_firebase_getx/app/modules/add_petugas/bindings/add_petugas_binding.dart';
import 'package:flutter_firebase_getx/app/modules/add_petugas/views/add_petugas_view.dart';
import 'package:flutter_firebase_getx/app/modules/admin/bindings/admin_binding.dart';
import 'package:flutter_firebase_getx/app/modules/admin/views/admin_view.dart';

import 'package:flutter_firebase_getx/app/modules/home/bindings/home_binding.dart';
import 'package:flutter_firebase_getx/app/modules/home/views/home_view.dart';
import 'package:flutter_firebase_getx/app/modules/login/bindings/login_binding.dart';
import 'package:flutter_firebase_getx/app/modules/login/views/login_view.dart';
import 'package:flutter_firebase_getx/app/modules/petugas/bindings/petugas_binding.dart';
import 'package:flutter_firebase_getx/app/modules/petugas/views/petugas_view.dart';
import 'package:flutter_firebase_getx/app/modules/profile/bindings/profile_binding.dart';
import 'package:flutter_firebase_getx/app/modules/profile/views/profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN,
      page: () => AdminView(),
      binding: AdminBinding(),
    ),
    GetPage(
      name: _Paths.PETUGAS,
      page: () => PetugasView(),
      binding: PetugasBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PETUGAS,
      page: () => AddPetugasView(),
      binding: AddPetugasBinding(),
    ),

  ];
}
