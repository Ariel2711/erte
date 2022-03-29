import 'dart:io';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:badges/badges.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:erte/app/data/models/user.dart';
import 'package:erte/app/modules/auth/controllers/auth_controller.dart';
import 'package:erte/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../const/color.dart';
import '../controllers/profil_controller.dart';

class ProfilView extends GetView<ProfilController> {
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  UserModel user = Get.arguments ?? UserModel();
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    controller.modelToController(authC.user);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 247, 247),
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Get.offAndToNamed(Routes.HOME),
          child: Icon(Icons.arrow_back, color: white,)),
        title: Text('Profil User'),
        centerTitle: true,
      ),
      body: authC.user.id == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Login Terlebih Dahulu",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  AppButton(
                    text: "Login",
                    color: blue,
                    textColor: white,
                    onTap: () => Get.toNamed(Routes.AUTH),
                  )
                ],
              ),
            )
          : SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    width: Get.width,
                    height: 120,
                    color: blue,
                  ),
                  Form(
                    key: form,
                    child: Center(
                      child: Column(children: [
                        Stack(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 60,
                                ),
                                Obx(
                                  () => controller.imagePath.value != ''
                                      ? AvatarGlow(
                                          endRadius: 50.0,
                                          glowColor:
                                              Color.fromARGB(255, 24, 76, 248),
                                          duration: Duration(seconds: 2),
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Container(
                                                height: 90,
                                                width: 90,
                                                decoration: BoxDecoration(
                                                  color: white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          90 / 2),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  controller.pickImage();
                                                },
                                                child: Badge(
                                                  badgeColor: white,
                                                  position:
                                                      BadgePosition.bottomEnd(),
                                                  badgeContent: Icon(
                                                    Icons
                                                        .camera_enhance_outlined,
                                                    color: blue,
                                                  ),
                                                  child: Container(
                                                    height: 80,
                                                    width: 80,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: FileImage(File(
                                                              controller
                                                                  .imagePath
                                                                  .value)),
                                                          fit: BoxFit.cover),
                                                      // border: Border.all(
                                                      //     color: white,
                                                      //     width: 3),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              90 / 2),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : authC.user.image != null
                                          ? AvatarGlow(
                                              endRadius: 50.0,
                                              glowColor: Color.fromARGB(
                                                  255, 24, 76, 248),
                                              duration: Duration(seconds: 2),
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Container(
                                                    height: 90,
                                                    width: 90,
                                                    decoration: BoxDecoration(
                                                      color: white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              90 / 2),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      controller.pickImage();
                                                    },
                                                    child: Badge(
                                                      badgeColor: white,
                                                      position: BadgePosition
                                                          .bottomEnd(),
                                                      badgeContent: Icon(
                                                        Icons
                                                            .camera_enhance_outlined,
                                                        color: blue,
                                                      ),
                                                      child: Container(
                                                        height: 80,
                                                        width: 80,
                                                        decoration:
                                                            BoxDecoration(
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  authC.user
                                                                      .image!),
                                                              fit:
                                                                  BoxFit.cover),
                                                          // border: Border.all(
                                                          //     color:
                                                          //         white,
                                                          //     width: 3),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      90 / 2),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : AvatarGlow(
                                              endRadius: 50.0,
                                              glowColor: Color.fromARGB(
                                                  255, 24, 76, 248),
                                              duration: Duration(seconds: 2),
                                              child: InkWell(
                                                onTap: () {
                                                  controller.pickImage();
                                                },
                                                child: Badge(
                                                  badgeColor: white,
                                                  position:
                                                      BadgePosition.bottomEnd(),
                                                  badgeContent: Icon(
                                                    Icons
                                                        .camera_enhance_outlined,
                                                    color: blue,
                                                  ),
                                                  child: Container(
                                                    height: 80,
                                                    width: 80,
                                                    child: Container(
                                                      width: 80,
                                                      height: 80,
                                                        child: Image.asset("images/profil.png", fit: BoxFit.cover,)),
                                                    decoration: BoxDecoration(
                                                      // image: DecorationImage(
                                                      //     image: FileImage(
                                                      //         File(controller
                                                      //             .imagePath
                                                      //             .value)),
                                                      //     fit: BoxFit.cover),
                                                      border: Border.all(
                                                          color: white,
                                                          width: 3),
                                                          color: white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              90 / 2),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                            child: Obx(() => Text(
                                  authC.user.nama!,
                                  style: TextStyle(fontSize: 25),
                                ))),
                        Center(
                            child: Obx(() => Text(
                                  authC.user.email!,
                                  style: TextStyle(fontSize: 20),
                                ))),
                        SizedBox(
                          height: 20,
                        ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // Center(
                        //     child: Text(
                        //   "User Profile",
                        //   style: TextStyle(fontSize: 30),
                        // )),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(children: [
                            AppTextField(
                                textFieldType: TextFieldType.NAME,
                                showCursor: true,
                                textInputAction: TextInputAction.next,
                                controller: controller.namaC,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Row(children: [
                                    Icon(
                                      Icons.person,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Nama",
                                    ),
                                  ]),
                                )),
                            SizedBox(
                              height: 15,
                            ),
                            FormField<String>(
                              validator: (value) =>
                                  controller.selectedKelamin.isNotEmpty
                                      ? null
                                      : "This field is required",
                              builder: (kelamin) => Obx(
                                () => ListTile(
                                  visualDensity: VisualDensity.compact,
                                  title: Text("Jenis Kelamin"),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  subtitle: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: RadioListTile<String>(
                                              value: "Laki-Laki",
                                              groupValue:
                                                  controller.selectedKelamin,
                                              onChanged: (value) =>
                                                  controller.selectedKelamin =
                                                      value ?? '',
                                              title: Text("Laki-Laki"),
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile<String>(
                                              value: "Perempuan",
                                              groupValue:
                                                  controller.selectedKelamin,
                                              onChanged: (value) =>
                                                  controller.selectedKelamin =
                                                      value ?? '',
                                              title: Text(
                                                "Perempuan"
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      if (kelamin.hasError)
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            kelamin.errorText!,
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 12),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            AppTextField(
                              textFieldType: TextFieldType.NAME,
                              textInputAction: TextInputAction.next,
                              controller: controller.tempatC,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text("Tempat Lahir")),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            ListTile(
                              leading: Container(
                                  width: 24,
                                  alignment: Alignment.centerLeft,
                                  child: Icon(
                                    Icons.calendar_today,
                                  )),
                              onTap: () async =>
                                  await controller.tanggalLahir(context),
                              title: Text(
                                "Tanggal Lahir",
                                style: TextStyle(fontSize: 12),
                              ),
                              subtitle: Obx(() => Text(
                                  controller.selectedTanggal is DateTime
                                      ? DateFormat("EEE, dd MMM y")
                                          .format(controller.selectedTanggal!)
                                      : '--')),
                            ),
                            Divider(
                              color: black,
                              height: 0,
                              thickness: 1,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            DropdownSearch<String>(
                              items: controller.listAgama,
                              onChanged: (value) =>
                                  controller.selectedAgama = value,
                              mode: Mode.MENU,
                              dropdownSearchDecoration: InputDecoration(
                                labelText: "Agama",
                                contentPadding: EdgeInsets.zero,
                              ),
                              selectedItem: controller.selectedAgama,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            DropdownSearch<String>(
                              items: controller.listStatus,
                              onChanged: (value) =>
                                  controller.selectedStatus = value,
                              mode: Mode.MENU,
                              dropdownSearchDecoration: InputDecoration(
                                labelText: "Status",
                                contentPadding: EdgeInsets.zero,
                              ),
                              selectedItem: controller.selectedStatus,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            FormField<String>(
                              validator: (value) =>
                                  controller.selectedWNI.isNotEmpty
                                      ? null
                                      : "This field is required",
                              builder: (wni) => Obx(
                                () => ListTile(
                                  visualDensity: VisualDensity.compact,
                                  title: Text("Kewarganegaraan"),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  subtitle: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: RadioListTile<String>(
                                              value: "WNI",
                                              groupValue:
                                                  controller.selectedWNI,
                                              onChanged: (value) => controller
                                                  .selectedWNI = value ?? '',
                                              title: Text("WNI"),
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile<String>(
                                              value: "WNA",
                                              groupValue:
                                                  controller.selectedWNI,
                                              onChanged: (value) => controller
                                                  .selectedWNI = value ?? '',
                                              title: Text(
                                                "WNA",
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      if (wni.hasError)
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            wni.errorText!,
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 12),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            DropdownSearch<String>(
                              items: controller.listPendidikan,
                              onChanged: (value) =>
                                  controller.selectedPendidikan = value,
                              mode: Mode.MENU,
                              dropdownSearchDecoration: InputDecoration(
                                labelText: "Pendidikan",
                                contentPadding: EdgeInsets.zero,
                              ),
                              selectedItem: controller.selectedPendidikan,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            DropdownSearch<String>(
                              items: controller.listGoldarah,
                              onChanged: (value) =>
                                  controller.selectGoldarah = value,
                              mode: Mode.MENU,
                              dropdownSearchDecoration: InputDecoration(
                                labelText: "Golongan Darah",
                                contentPadding: EdgeInsets.zero,
                              ),
                              selectedItem: controller.selectGoldarah,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            AppTextField(
                              textFieldType: TextFieldType.NAME,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text("Pekerjaan")),
                              controller: controller.pekerjaanC,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            AppTextField(
                              textFieldType: TextFieldType.PHONE,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text("NIK")),
                              controller: controller.nikC,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            AppTextField(
                              textFieldType: TextFieldType.PHONE,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text("No KK")),
                              controller: controller.kkC,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            AppTextField(
                              textFieldType: TextFieldType.NAME,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text("Alamat")),
                              controller: controller.alamatC,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            AppTextField(
                              textFieldType: TextFieldType.PHONE,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text("RT")),
                              controller: controller.rtC,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            AppTextField(
                              textFieldType: TextFieldType.PHONE,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text("RW")),
                              controller: controller.rwC,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            AppTextField(
                              textFieldType: TextFieldType.NAME,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text("Kelurahan")),
                              controller: controller.kelurahanC,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            AppTextField(
                              textFieldType: TextFieldType.NAME,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text("Kecamatan")),
                              controller: controller.kecamatanC,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            AppTextField(
                                textFieldType: TextFieldType.EMAIL,
                                enabled: false,
                                showCursor: true,
                                controller: controller.emailC,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Row(children: [
                                    Icon(
                                      Icons.email,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Email",
                                    ),
                                  ]),
                                )),
                            SizedBox(
                              height: 15,
                            ),
                            AppTextField(
                                enabled: false,
                                readOnly: true,
                                showCursor: true,
                                textFieldType: TextFieldType.PASSWORD,
                                keyboardType: TextInputType.visiblePassword,
                                controller: controller.passC,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Input your password",
                                  label: Row(
                                    children: [
                                      Icon(
                                        Icons.lock,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Password",
                                      )
                                    ],
                                  ),
                                )),
                            SizedBox(
                              height: 15,
                            ),
                          ]),
                        ),
                        Obx(
                          () => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: Get.width,
                              child: FloatingActionButton.extended(
                                  onPressed: controller.isSaving
                                      ? null
                                      : () {
                                          if (form.currentState!.validate()) {
                                            controller.store(authC.user);
                                          }
                                        },
                                  label: controller.isSaving
                                      ? Text(
                                          "Loading...",
                                        )
                                      : Text(
                                          "Ubah Profil",
                                        )),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}