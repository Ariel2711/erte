import 'package:erte/app/const/color.dart';
import 'package:erte/app/data/models/s_pengantar.dart';
import 'package:erte/app/modules/auth/controllers/auth_controller.dart';
import 'package:erte/app/modules/s_pengantar/controllers/s_pengantar_controller.dart';
import 'package:erte/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../controllers/admin_surat_controller.dart';

class AdminSuratView extends GetView<AdminSuratController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Verifikasi Admin'),
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
        body: Obx(() => controller.pengantars.length < 1
            ? Center(
                child: Text(
                  "Kosong",
                  style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              )
            : Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: Get.height,
                width: Get.width,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: ScrollPhysics(),
                      itemCount: controller.pengantars.length,
                      itemBuilder: (context, index) => PengantarCard(
                          pengantar: controller.pengantars[index])),
                ),
              )));
  }
}

class PengantarCard extends GetView<SPengantarController> {
  PengantarCard({required this.pengantar});
  Pengantar pengantar;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: Get.width,
      height: 110,
      margin: EdgeInsets.all(10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage("images/pengantar.png"),
                      fit: BoxFit.fitHeight)),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    "${pengantar.nama}",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                pengantar.verifikasi == "Sudah"
                    ? SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          "Sudah Diverifikasi",
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          "Belum Diverifikasi",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "${DateFormat.yMMMEd().format(pengantar.waktu!)}",
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: white,
        boxShadow: [
          BoxShadow(
            color: dark,
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 1),
          )
        ],
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
