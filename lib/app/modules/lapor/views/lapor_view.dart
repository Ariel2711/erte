import 'package:erte/app/data/models/lapor.dart';
import 'package:erte/app/modules/auth/controllers/auth_controller.dart';
import 'package:erte/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../controllers/lapor_controller.dart';

class LaporView extends GetView<LaporController> {
  final authC = Get.find<AuthController>();
  Lapor lapor = Get.arguments ?? Lapor();
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 252, 247, 247),
        appBar: AppBar(
          title: Text('Lapor RT'),
          // centerTitle: true,
          leading: InkWell(
              onTap: () => authC.user.role == "Admin"
                  ? Get.offAndToNamed(Routes.ADMIN)
                  : Get.offAndToNamed(Routes.HOME),
              child: Icon(
                Icons.arrow_back,
                color: white,
              )),
        ),
        body: authC.user.role == "Admin"
            ? ListView.builder(
                itemCount: controller.lapors.length,
                itemBuilder: (context, index) => LaporRT(lapor: controller.lapors[index]))
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: form,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Silahkan sampaikan laporan anda kepada Ketua RT atau Pengurus RT di bawah ini",
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Nama"),
                        SizedBox(
                          height: 5,
                        ),
                        AppTextField(
                          controller: controller.namaC,
                          textFieldType: TextFieldType.NAME,
                          textInputAction: TextInputAction.next,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Judul Laporan"),
                        SizedBox(
                          height: 5,
                        ),
                        AppTextField(
                          controller: controller.judulC,
                          textFieldType: TextFieldType.NAME,
                          textInputAction: TextInputAction.next,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Deskripsi Laporan"),
                        AppTextField(
                          controller: controller.deskripsiC,
                          textFieldType: TextFieldType.NAME,
                          textInputAction: TextInputAction.done,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Obx(() => controller.imagePath.value != ''
                            ? Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  height: 200,
                                  width: 400,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: FileImage(
                                              File(controller.imagePath.value)),
                                          fit: BoxFit.cover)),
                                ))
                            : lapor.image != null
                                ? Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Container(
                                      height: 200,
                                      width: 400,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: NetworkImage(lapor.image!),
                                              fit: BoxFit.cover)),
                                    ))
                                : Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Container(
                                      width: 400,
                                      height: 200,
                                      child: Center(
                                          child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Image(
                                            image:
                                                AssetImage("images/home.png")),
                                      )),
                                      decoration: BoxDecoration(
                                        color: white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  )),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Container(
                            width: 160,
                            child: FloatingActionButton.extended(
                                onPressed: () => controller.pickImage(),
                                label: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.upload,
                                      color: white,
                                    ),
                                    Text("Upload Foto",
                                        style: TextStyle(color: white)),
                                  ],
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Obx(
                            () => Container(
                              width: Get.width,
                              child: FloatingActionButton.extended(
                                  onPressed: controller.isSaving
                                      ? null
                                      : () {
                                          if (form.currentState!.validate()) {
                                            controller.store(lapor);
                                          }
                                        },
                                  label: controller.isSaving
                                      ? Text("Loading...")
                                      : Text("Kirim")),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
  }
}

class LaporRT extends StatelessWidget {
  LaporRT({required this.lapor});
  Lapor lapor;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: SingleChildScrollView(
            scrollDirection: Axis.horizontal, child: Text(lapor.nama!)),
        subtitle: Text("Rp.${lapor.judul}"));
  }
}
