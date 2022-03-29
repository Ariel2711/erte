import 'package:dropdown_search/dropdown_search.dart';
import 'package:erte/app/data/models/kas.dart';
import 'package:erte/app/modules/auth/controllers/auth_controller.dart';
import 'package:erte/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../controllers/kas_controller.dart';

class KasView extends GetView<KasController> {
  final authC = Get.find<AuthController>();
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  Kas kas = Get.arguments ?? Kas();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () => authC.user.role == "Admin"
            ? Get.offAndToNamed(Routes.ADMIN) : Get.offAndToNamed(Routes.HOME),
            child: Icon(
              Icons.arrow_back,
              color: white,
            )),
        title: Text('Kas RT'),
        // centerTitle: true,
      ),
      body: authC.user.role == "Admin"
          ? Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: form,
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    DropdownSearch<String>(
                      items: controller.listKategori,
                      onChanged: (value) => controller.selectedKategori = value,
                      mode: Mode.MENU,
                      dropdownSearchDecoration: InputDecoration(
                        labelText: "Kategori",
                        contentPadding: EdgeInsets.zero,
                      ),
                      selectedItem: controller.selectedKategori,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    AppTextField(
                        textFieldType: TextFieldType.PHONE,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text("Jumlah Rp.")),
                        controller: controller.uangC),
                    SizedBox(
                      height: 15,
                    ),
                    AppTextField(
                        textFieldType: TextFieldType.NAME,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text("Deskripsi")),
                        controller: controller.deskripsiC),
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
                                      controller.store(kas);
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
                  ],
                )),
              ),
            )
          : ListView.builder(
              itemCount: controller.kass.length,
              itemBuilder: (context, index) =>
                  KasRT(kas: controller.kass[index])),
    );
  }
}

class KasRT extends GetView<KasController> {
  KasRT({required this.kas});
  Kas kas;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: SingleChildScrollView(
            scrollDirection: Axis.horizontal, child: Text(kas.kategori!)),
        subtitle: Text("Rp.${kas.uang}"));
  }
}
