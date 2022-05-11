import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_getx/app/controllers/auth_controller.dart';
import 'package:flutter_firebase_getx/app/utils/loading.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Aplication",
      initialRoute: Routes.QUERY,
      getPages: AppPages.routes,
    );
    // return StreamBuilder<User?>(
    //   stream: authC.streamAuthStatus,
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.active) {
    //       print(snapshot.data);
    //       return GetMaterialApp(
    //         title: "Application",
    //         initialRoute: snapshot.data != null && snapshot.data!.emailVerified  == true ? Routes.HOME : Routes.LOGIN,
    //         getPages: AppPages.routes,
    //       );
    //     }
    //     return LoadingView();
    //   },
    // );
  }
}
