import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_getx/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  // login with google

  void loginGoogle() async {
    try {
      GoogleSignIn _googleSignIn = GoogleSignIn();
      GoogleSignInAccount? myAccount = await _googleSignIn.signIn();
      if (myAccount != null) {
        print(myAccount);
        // Obtain the auth details from the request
        final GoogleSignInAuthentication? googleAuth =
            await myAccount.authentication;
        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        // Once signed in, return the UserCredential
        await FirebaseAuth.instance.signInWithCredential(credential);
        Get.offAllNamed(Routes.HOME);
      } else {
        throw "Belum Memiliki Akun Google";
      }
    } catch (error) {
      print(error);
      Get.defaultDialog(
          title: "TERJADI KESALAHAN", middleText: "${error.toString()}");
    }
  }

  /////////////////////
  // void login Phone
  void loginPhone(String phone) async {
    await auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential) {
        print("verificationCompleted".toUpperCase());
        print("phoneAuthCredential");
        print(PhoneAuthCredential);
        print("============================");
      },
      verificationFailed: (error) => Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: error.message!,
      ),
      codeSent: (verificationId, forceResendingToken) {
        print("CodeSent".toUpperCase());
        print("verificationId");
        print(verificationId);
        print("----------------------------");
        print("forceResendingToken");
        print(forceResendingToken);

        print("============================");
        Get.toNamed(Routes.OTP, arguments: verificationId);
      },
      codeAutoRetrievalTimeout: (verificationId) {
        print("codeAutoRetrievalTimeout".toUpperCase());
        print("verificationId");
        print(verificationId);
        print("----------------------------");
      },
    );
  }

  // Code OTP Verification

  void loginOtp(String otp, String verifId) async {
    try {
      PhoneAuthCredential myCredential = await PhoneAuthProvider.credential(
        verificationId: verifId,
        smsCode: otp,
      );
      await auth.signInWithCredential(myCredential);
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      print(e.toString());
    }
  }

  /////////////////////////

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

  // login
  void login(String email, String password) async {
    try {
      UserCredential myUser = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (myUser.user!.emailVerified) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.defaultDialog(
            title: "Vertification Email ",
            middleText:
                "Kamu Perlu Vertifikasi Email Terlebih Dahulu. Apakah kamu ingin dikirimkan verifikasi ulang ?",
            onConfirm: () async {
              await myUser.user!.sendEmailVerification();
              Get.back();
            },
            textConfirm: "Kirim ulang",
            textCancel: "kembali");
      }
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
