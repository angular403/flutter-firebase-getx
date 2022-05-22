import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_getx/app/data/models/model_user.dart';
import 'package:flutter_firebase_getx/app/routes/app_pages.dart';
import 'package:get/get.dart';


class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  var currentUser = ModelUser().obs;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  // Signup
  void signup(String email, String password) async {
    try {
      UserCredential myUser = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await myUser.user!.sendEmailVerification();
      Get.defaultDialog(
          title: "Vertification Email",
          middleText: "Kami telah mengirimkan email vertifikasi ke $email.",
          textConfirm: "Ya, Saya Akan Cek Email",
          onConfirm: () {
            Get.back(); // Close Dialog
            Get.back(); // Go to login
          });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Get.defaultDialog(
          title: "TERJADI KESALAHAN ",
          middleText: "The password provided is too weak.",
        );
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.defaultDialog(
          title: "TERJADI KESALAHAN ",
          middleText: "The account already exists for that email.",
        );
      }
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "TERJADI KESALAHAN ",
        middleText: "Tidak dapat mendaftarkan akun ini.",
      );
    }
  }

  void errorMsg(String msg) {
    Get.defaultDialog(
      title: "Terjadi Kesalahan",
      middleText: msg,
    );
  }

  // login
  void login(String email, String password) async {
    try {
      UserCredential myUser = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final docUser = await FirebaseFirestore.instance
          .collection("users")
          .doc(myUser.user!.uid)
          .get();

      currentUser(ModelUser.fromJson(docUser.data()!));
      update();
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "No user found for that email.",
        );
      } else if (e.code == 'email-already-in-use') {
        print('wrong password provided for that users.');
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "wrong password provided for that users.",
        );
      }
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Tidak dapat login dengan akun ini.",
      );
    }
  }

  // logout
  void logout() async {
    await FirebaseAuth.instance.signOut();
    currentUser(ModelUser());
    update();
    Get.offAllNamed(Routes.LOGIN);
  }

// Reset Password
  void resetPassword(String email) async {
    if (email != "" && GetUtils.isEmail(email)) {
      try {
        await auth.sendPasswordResetEmail(email: email);
        Get.defaultDialog(
            title: "Berhasil ",
            middleText:
                "Kami telah mengirimkan reset password ke email $email.",
            onConfirm: () {
              Get.back(); // hapus dialog
              Get.back(); // go to login
            },
            textConfirm: "Ya, Saya Mengerti.");
      } catch (e) {
        Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "Tidak dapat mengirimkan reset password.",
        );
      }
    } else {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Email Tidak Valid.",
      );
    }
  }
}
