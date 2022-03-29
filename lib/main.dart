import 'package:erte/app/modules/auth/controllers/auth_controller.dart';
import 'package:erte/app/modules/profil/controllers/profil_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseStorage.instance;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);
  final profilC = Get.put(ProfilController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ERTE",
      initialRoute: Routes.INTRO,
      getPages: AppPages.routes,
    );
  }
}
