import 'package:get/get.dart';

import 'package:flutter_firebase_getx/app/modules/add_movie/bindings/add_movie_binding.dart';
import 'package:flutter_firebase_getx/app/modules/add_movie/views/add_movie_view.dart';
import 'package:flutter_firebase_getx/app/modules/add_product/bindings/add_product_binding.dart';
import 'package:flutter_firebase_getx/app/modules/add_product/views/add_product_view.dart';
import 'package:flutter_firebase_getx/app/modules/edit_movie/bindings/edit_movie_binding.dart';
import 'package:flutter_firebase_getx/app/modules/edit_movie/views/edit_movie_view.dart';
import 'package:flutter_firebase_getx/app/modules/edit_product/bindings/edit_product_binding.dart';
import 'package:flutter_firebase_getx/app/modules/edit_product/views/edit_product_view.dart';
import 'package:flutter_firebase_getx/app/modules/home/bindings/home_binding.dart';
import 'package:flutter_firebase_getx/app/modules/home/views/home_view.dart';
import 'package:flutter_firebase_getx/app/modules/login/bindings/login_binding.dart';
import 'package:flutter_firebase_getx/app/modules/login/views/login_view.dart';
import 'package:flutter_firebase_getx/app/modules/movie/bindings/movie_binding.dart';
import 'package:flutter_firebase_getx/app/modules/movie/views/movie_view.dart';
import 'package:flutter_firebase_getx/app/modules/otp/bindings/otp_binding.dart';
import 'package:flutter_firebase_getx/app/modules/otp/views/otp_view.dart';
import 'package:flutter_firebase_getx/app/modules/query/bindings/query_binding.dart';
import 'package:flutter_firebase_getx/app/modules/query/views/query_view.dart';
import 'package:flutter_firebase_getx/app/modules/reset_password/bindings/reset_password_binding.dart';
import 'package:flutter_firebase_getx/app/modules/reset_password/views/reset_password_view.dart';
import 'package:flutter_firebase_getx/app/modules/signup/bindings/signup_binding.dart';
import 'package:flutter_firebase_getx/app/modules/signup/views/signup_view.dart';

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
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PRODUCT,
      page: () => AddProductView(),
      binding: AddProductBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PRODUCT,
      page: () => EditProductView(),
      binding: EditProductBinding(),
    ),
    GetPage(
      name: _Paths.QUERY,
      page: () => QueryView(),
      binding: QueryBinding(),
    ),
    GetPage(
      name: _Paths.MOVIE,
      page: () => MovieView(),
      binding: MovieBinding(),
    ),
    GetPage(
      name: _Paths.ADD_MOVIE,
      page: () => AddMovieView(),
      binding: AddMovieBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_MOVIE,
      page: () => EditMovieView(),
      binding: EditMovieBinding(),
    ),
  ];
}
