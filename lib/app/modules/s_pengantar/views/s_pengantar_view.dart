import 'package:dropdown_search/dropdown_search.dart';
import 'package:erte/app/const/color.dart';
import 'package:erte/app/data/models/absen.dart';
import 'package:erte/app/data/models/s_pengantar.dart';
import 'package:erte/app/modules/auth/controllers/auth_controller.dart';
import 'package:erte/app/modules/profil/controllers/profil_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

import '../controllers/s_pengantar_controller.dart';

class SPengantarView extends GetView<SPengantarController> {
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  final authC = Get.find<AuthController>();
  Pengantar pengantar = Pengantar();
  Absen absen = Absen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Surat Pengantar'),
        leading: InkWell(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back,
              color: white,
            )),
        // centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: form,
          child: SingleChildScrollView(
            child: Column(children: [
              AppTextField(
                textFieldType: TextFieldType.NAME,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("Nama")),
                controller: controller.namaC,
              ),
              SizedBox(
                height: 15,
              ),
              FormField<String>(
                validator: (value) => controller.selectedKelamin.isNotEmpty
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
                                selectedTileColor: primary,
                                activeColor: primary,
                                toggleable: true,
                                value: "Laki-Laki",
                                groupValue: controller.selectedKelamin,
                                onChanged: (value) =>
                                    controller.selectedKelamin = value ?? '',
                                title: Text("Laki-Laki"),
                              ),
                            ),
                            Expanded(
                              child: RadioListTile<String>(
                                selectedTileColor: primary,
                                activeColor: primary,
                                toggleable: true,
                                value: "Perempuan",
                                groupValue: controller.selectedKelamin,
                                onChanged: (value) =>
                                    controller.selectedKelamin = value ?? '',
                                title: Text(
                                  "Perempuan",
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
                              style: TextStyle(color: Colors.red, fontSize: 12),
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
                    border: OutlineInputBorder(), label: Text("Tempat Lahir")),
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
                onTap: () async => await controller.tanggalLahir(context),
                title: Text(
                  "Tanggal Lahir",
                  style: TextStyle(fontSize: 12),
                ),
                subtitle: Obx(() => Text(controller.selectedTanggal is DateTime
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
                validator: (value) => controller.selectedAgama != null
                ? null
                : "This field is required",
                items: controller.listAgama,
                onChanged: (value) => controller.selectedAgama = value,
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
                validator: (value) => controller.selectedStatus != null
                ? null
                : "This field is required",
                items: controller.listStatus,
                onChanged: (value) => controller.selectedStatus = value,
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
                validator: (value) => controller.selectedWNI.isNotEmpty
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
                                selectedTileColor: primary,
                                activeColor: primary,
                                toggleable: true,
                                value: "WNI",
                                groupValue: controller.selectedWNI,
                                onChanged: (value) =>
                                    controller.selectedWNI = value ?? '',
                                title: Text("WNI"),
                              ),
                            ),
                            Expanded(
                              child: RadioListTile<String>(
                                selectedTileColor: primary,
                                activeColor: primary,
                                toggleable: true,
                                value: "WNA",
                                groupValue: controller.selectedWNI,
                                onChanged: (value) =>
                                    controller.selectedWNI = value ?? '',
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
                              style: TextStyle(color: Colors.red, fontSize: 12),
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
                validator: (value) => controller.selectedPendidikan != null
                ? null
                : "This field is required",
                items: controller.listPendidikan,
                onChanged: (value) => controller.selectedPendidikan = value,
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
              AppTextField(
                textFieldType: TextFieldType.NAME,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("Pekerjaan")),
                controller: controller.pekerjaanC,
              ),
              SizedBox(
                height: 15,
              ),
              AppTextField(
                textFieldType: TextFieldType.PHONE,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("NIK")),
                controller: controller.nikC,
              ),
              SizedBox(
                height: 15,
              ),
              AppTextField(
                textFieldType: TextFieldType.PHONE,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("No KK")),
                controller: controller.kkC,
              ),
              SizedBox(
                height: 15,
              ),
              AppTextField(
                textFieldType: TextFieldType.NAME,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("Alamat")),
                controller: controller.alamatC,
              ),
              SizedBox(
                height: 15,
              ),
              DropdownSearch<String>(
                validator: (value) => controller.selectedKeperluan1 != null
                ? null
                : "This field is required",
                items: controller.listKeperluan1,
                onChanged: (value) => controller.selectedKeperluan1 = value,
                mode: Mode.MENU,
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Keperluan 1",
                  contentPadding: EdgeInsets.zero,
                ),
                selectedItem: controller.selectedKeperluan1,
              ),
              SizedBox(
                height: 15,
              ),
              DropdownSearch<String>(
                items: controller.listKeperluan2,
                onChanged: (value) => controller.selectedKeperluan2 = value,
                mode: Mode.MENU,
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Keperluan 2",
                  contentPadding: EdgeInsets.zero,
                ),
                selectedItem: controller.selectedKeperluan2,
              ),
              SizedBox(
                height: 15,
              ),
              AppTextField(
                textFieldType: TextFieldType.NAME,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Email / No Telepon")),
                controller: controller.emailC,
              ),
              SizedBox(
                height: 15,
              ),
              Obx(
                () => Container(
                  width: Get.width,
                  child: FloatingActionButton.extended(
                      onPressed: controller.isSaving
                          ? null
                          : () {
                              if (form.currentState!.validate()) {
                                controller.store(pengantar);
                                controller.storeabsen(absen);
                                controller.getPDF(pengantar);
                              }
                            },
                      label: controller.isSaving
                          ? Text("Loading...")
                          : Text("Kirim")),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ]),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => controller.getPDF(pengantar),
      //   child: Icon(Icons.note),
      // ),
    );
  }
}
