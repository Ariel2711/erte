import 'package:erte/app/data/database.dart';
import 'package:erte/app/data/models/user.dart';
import 'package:erte/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // RxBool hidden = true.obs;
  FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?> streamAuth() => _auth.authStateChanges();

  var role = "User";

  var currUser = UserModel().obs;
  UserModel get user => currUser.value;
  set user(UserModel value) => currUser.value = value;

  var _isRegis = false.obs;
  bool get isRegis => _isRegis.value;
  set isRegis(value) => _isRegis.value = value;

  var _isSaving = false.obs;
  bool get isSaving => _isSaving.value;
  set isSaving(value) => _isSaving.value = value;

  late Rx<User?> firebaseUser;
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController nameC = TextEditingController();

  login() async {
    try {
      final myuser = await _auth.signInWithEmailAndPassword(
          email: emailC.text, password: passwordC.text);
      // .then((value) => Get.toNamed(Routes.HOME));
      if (myuser.user!.emailVerified) {
        Get.offAndToNamed(Routes.HOME);
      } else {
        Get.defaultDialog(
          title: "Failed Login",
          middleText: "Verify email first. Do you want to re-sent",
          onConfirm: () async {
            await myuser.user!.sendEmailVerification();
            Get.back();
          },
          textConfirm: "Yes",
          textCancel: "Cancel",
        );
      }
    } on FirebaseAuthException catch (e) {
      Get.defaultDialog(
        title: "Error",
        textConfirm: "Okay",
        onConfirm: () => Get.back(),
      );
    } catch (e) {
      Get.defaultDialog(
        title: "Error",
        textConfirm: "Okay",
        onConfirm: () => Get.back(),
      );
    }
  }

  register() async {
    try {
      isSaving = true;
      UserModel user = UserModel(
        nama: nameC.text,
        email: emailC.text,
        password: passwordC.text,
        role: role,
        waktu: DateTime.now(),
      );

      final myuser = await _auth
          .createUserWithEmailAndPassword(
        email: emailC.text,
        password: passwordC.text,
      )
          .then((value) async {
        await value.user!.sendEmailVerification();
        user.id = value.user?.uid;
        if (user.id != null) {
          firestore
              .collection(userCollection)
              .doc(user.id)
              .set(user.toJson)
              .then((value) {
            Get.defaultDialog(
              title: "Succeed",
              textConfirm: "Okay",
              onConfirm: () {
                // Get.toNamed(Routes.HOME);
                nameC.clear();
                passwordC.clear();
                emailC.clear();
                Get.back();
              },
            );
          });
        }
      });
      isSaving = false;
    } on FirebaseAuthException catch (e) {
      isSaving = false;
      Get.defaultDialog(
        title: "Error",
        textConfirm: "Okay",
        onConfirm: () {
          Get.back();
          nameC.clear();
          passwordC.clear();
          emailC.clear();
          // selectedGender = 0;
          // selectedDate = DateTime.now();
        },
      );
    }
  }

  void logout() async {
    Get.defaultDialog(
      title: "Logout",
      middleText: "Are you sure you want to logout?",
      onConfirm: () async {
        await FirebaseAuth.instance.signOut();
        Get.back();
        isSaving = false;
        // selectedGender = 0;
        // selectedDate = DateTime.now();
      },
      textConfirm: "Yes",
      textCancel: "No",
    );
  }

  void reset(String email) async {
    if (email != "" && GetUtils.isEmail(email)) {
      await _auth.sendPasswordResetEmail(email: email);
      Get.defaultDialog(
        title: "Succeed",
        middleText: "Successfully sent the reset password to your email",
        onConfirm: () {
          Get.back();
          Get.back();
        },
        textConfirm: "Okay",
      );
    } else {
      Get.defaultDialog(
        title: "Warning",
        middleText: "Invalid Email",
        textConfirm: "Okay",
        onConfirm: () => Get.back(),
      );
    }
  }

  streamUser(User? fuser) {
    if (fuser != null) {
      currUser.bindStream(UserModel().streamList(fuser.uid));
      print("auth id = " + fuser.uid);
      print("tojson =  ${user.toJson}");
    } else {
      print("null auth");
      user = UserModel();
      print("toJson =  ${user.toJson}");
    }
  }

  @override
  void onInit() {
    super.onInit();
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, streamUser);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // hidden.value = true;
    emailC.clear();
    passwordC.clear();
    nameC.clear();
    // selectedGender = 0;
    // selectedDate = DateTime.now();
  }
}
