import 'dart:io';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:erte/app/const/color.dart';
import 'package:erte/app/data/models/informasi.dart';
import 'package:erte/app/modules/auth/controllers/auth_controller.dart';
import 'package:erte/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final authC = Get.find<AuthController>();
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        backgroundColor: Color.fromARGB(255, 252, 247, 247),
        drawer: Drawer(
          backgroundColor: white,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: double.infinity,
              height: 155,
              color: primary,
              child: Center(
                child: Column(
                  children: [
                    Obx(
                      () => authC.user.image != null
                          ? AvatarGlow(
                              endRadius: 50.0,
                              glowColor: white,
                              duration: Duration(seconds: 1),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: primary,
                                      borderRadius:
                                          BorderRadius.circular(80 / 2),
                                    ),
                                  ),
                                  Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              NetworkImage(authC.user.image!),
                                          fit: BoxFit.cover),
                                      border: Border.all(
                                          color: Colors.white10, width: 3),
                                      borderRadius:
                                          BorderRadius.circular(100 / 2),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : AvatarGlow(
                              endRadius: 50.0,
                              glowColor: white,
                              duration: Duration(seconds: 1),
                              child: Material(
                                  elevation: 6.0,
                                  shape: CircleBorder(),
                                  child: Container(
                                      height: 80,
                                      width: 80,
                                      child: Image.asset(
                                        "images/profil.png",
                                        fit: BoxFit.cover,
                                      ))),
                            ),
                    ),
                    Obx(
                      () => SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          authC.user.nama ?? "Guest",
                          style: TextStyle(color: white, fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Obx(
                      () => SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          authC.user.email ?? "-",
                          style: TextStyle(color: white, fontSize: 17),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(left: 10),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Obx(
                            () => authC.user.role == "Admin"
                                ? ListTile(
                                    onTap: () => Get.toNamed(Routes.ADMIN),
                                    leading: Icon(
                                      Icons.person_outline_outlined,
                                      color: primary,
                                    ),
                                    title: Text(
                                      "Halaman Admin",
                                      style: TextStyle(color: primary),
                                    ),
                                  )
                                : Container(),
                          ),
                          ListTile(
                            onTap: () => Get.toNamed(Routes.PROFIL),
                            leading: Icon(
                              Icons.person,
                              color: primary,
                            ),
                            title: Text(
                              "Profil",
                              style: TextStyle(color: primary),
                            ),
                          ),
                          Obx(() => authC.user.id != null
                              ? ListTile(
                                  onTap: () => Get.toNamed(Routes.RIWAYAT),
                                  leading: Icon(
                                    Icons.history,
                                    color: primary,
                                  ),
                                  title: Text(
                                    "Riwayat",
                                    style: TextStyle(color: primary),
                                  ),
                                )
                              : Container()),
                          ListTile(
                            onTap: () => Get.toNamed(Routes.LAPOR),
                            leading: Icon(
                              Icons.notifications,
                              color: primary,
                            ),
                            title: Text(
                              "Lapor RT",
                              style: TextStyle(color: primary),
                            ),
                          ),
                          ListTile(
                            onTap: () => Get.toNamed(Routes.KAS),
                            leading: Icon(
                              Icons.money,
                              color: primary,
                            ),
                            title: Text(
                              "Kas RT",
                              style: TextStyle(color: primary),
                            ),
                          ),
                          Obx(
                            () => authC.user.id == null
                                ? ListTile(
                                    onTap: () => Get.toNamed(Routes.AUTH),
                                    leading: Icon(
                                      Icons.login,
                                      color: primary,
                                    ),
                                    title: Text(
                                      "Login",
                                      style: TextStyle(color: primary),
                                    ),
                                  )
                                : ListTile(
                                    onTap: () => authC.logout(),
                                    leading: Icon(
                                      Icons.logout,
                                      color: primary,
                                    ),
                                    title: Text(
                                      "Logout",
                                      style: TextStyle(color: primary),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ]),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: Get.width,
                height: 250,
                color: primary,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: InkWell(
                              child: Icon(
                                Icons.menu,
                                color: white,
                              ),
                              onTap: () =>
                                  _globalKey.currentState!.openDrawer(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Container(
                                height: 40,
                                width: 70,
                                child: Image.asset(
                                  "images/rtq_putih.png",
                                  fit: BoxFit.fitWidth,
                                )),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "${DateFormat.yMMMEd().format(DateTime.now())}",
                          style: TextStyle(
                              color: white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 90,
                        width: 90,
                        child: Image.asset(
                          "images/home.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "Green Living Residence",
                            style: TextStyle(
                              color: white,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "RT 02 RW 09",
                            style: TextStyle(
                              color: white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 130,
                            width: 130,
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
                                borderRadius: BorderRadius.circular(10)),
                            child: InkWell(
                              onTap: ()=> Get.toNamed(Routes.S_PENGANTAR),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        height: 70,
                                        width: 70,
                                        child: Image.asset(
                                          "images/pernyataan.png",
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Column(
                                    children: [
                                      Text("Surat"),
                                      Text("Pengantar")
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 130,
                            width: 130,
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
                                borderRadius: BorderRadius.circular(10)),
                            child: InkWell(
                              onTap: ()=> Get.toNamed(Routes.FORM_KK),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        height: 70,
                                        width: 70,
                                        child: Image.asset(
                                          "images/kk.png",
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Column(
                                    children: [Text("Form"), Text("KK")],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 130,
                            width: 130,
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
                                borderRadius: BorderRadius.circular(10)),
                            child: InkWell(
                              onTap: ()=>Get.toNamed(Routes.S_DOMISILI),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        height: 70,
                                        width: 70,
                                        child: Image.asset(
                                          "images/domisili.png",
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Column(
                                    children: [Text("Surat"), Text("Domisili")],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 130,
                            width: 130,
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
                                borderRadius: BorderRadius.circular(10)),
                            child: InkWell(
                              onTap: () => Get.toNamed(Routes.FORM_KTP),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        height: 70,
                                        width: 70,
                                        child: Image.asset(
                                          "images/ktp.png",
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Column(
                                    children: [Text("Form"), Text("KTP")],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Informasi",
                          style: TextStyle(
                              color: primary,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.INFO_LENGKAP);
                            },
                            child: Row(
                              children: [
                                Text(
                                  "Lihat Semua",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: primary),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: primary,
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: 200,
                    child: Obx(
                      () => controller.infos.length < 1
                          ? Center(
                              child: Text(
                                "Kosong",
                                style: TextStyle(color: primary),
                              ),
                            )
                          : SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.infos.length,
                                physics: ScrollPhysics(),
                                itemBuilder: (context, index) => InfoCard(
                                  info: controller.infos[index],
                                ),
                              ),
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class InfoCard extends GetView<HomeController> {
  InfoCard({required this.info});
  Informasi info;
  @override
  Widget build(BuildContext context) {
    controller.modelToController(info);
    return InkWell(
      onTap: () async {
        await showDialog(
            context: context,
            builder: (context) {
              return SimpleDialog(
                backgroundColor: white,
                children: [
                  Container(
                    height: 480,
                    width: 100,
                    decoration: BoxDecoration(color: white),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              "Informasi RT",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Form(
                            child: SingleChildScrollView(
                              child: Column(children: [
                                Text("Judul"),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(info.judul!, style: TextStyle(fontSize: 16),),
                                SizedBox(
                                  height: 20,
                                ),
                                Text("Deskripsi"),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(info.deskripsi!, style: TextStyle(fontSize: 13),),
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
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  image: FileImage(File(
                                                      controller
                                                          .imagePath.value)),
                                                  fit: BoxFit.cover)),
                                        ))
                                    : info.image != null
                                        ? Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Container(
                                              height: 200,
                                              width: 400,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          info.image!),
                                                      fit: BoxFit.cover)),
                                            ))
                                        : Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Container(
                                              width: 400,
                                              height: 200,
                                              child: Center(
                                                  child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Image(
                                                    image: AssetImage(
                                                        "images/home.png")),
                                              )),
                                              decoration: BoxDecoration(
                                                color: white,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                          )),
                                SizedBox(
                                  height: 10,
                                ),
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            });
        // controller.judulC.clear();
        // controller.deskripsiC.clear();
      },
      child: Container(
        padding: EdgeInsets.all(10),
        width: 250,
        height: 200,
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              info.image != null
                  ? Container(
                      height: 90,
                      width: 240,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(info.image!),
                              fit: BoxFit.cover)),
                    )
                  : Container(
                      height: 90,
                      width: 240,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage("assets/home.png"),
                              fit: BoxFit.fitHeight)),
                    ),
              SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  info.judul!,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(
                height: 5,
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
      ),
    );
  }
}

// appBar: AppBar(
        //   title: Text('Home'),
        //   centerTitle: true,
        //   actions: [
        //     IconButton(
        //         onPressed: () => Get.toNamed(Routes.PROFIL),
        //         icon: Icon(Icons.person))
        //   ],
        // ),

// Container(
                          //   height: 130,
                          //   width: 130,
                          //   decoration: BoxDecoration(
                          //       color: white,
                          //       borderRadius: BorderRadius.circular(10)),
                          //   child: Column(
                          //     children: [
                          //       Padding(
                          //         padding: const EdgeInsets.all(8.0),
                          //         child: Container(
                          //             height: 70,
                          //             width: 70,
                          //             child: InkWell(
                          //               onTap: () =>
                          //                   Get.toNamed(Routes.S_KELAHIRAN),
                          //               child: Image.asset(
                          //                 "images/kelahiran.png",
                          //                 fit: BoxFit.cover,
                          //               ),
                          //             )),
                          //       ),
                          //       SizedBox(
                          //         height: 5,
                          //       ),
                          //       InkWell(
                          //         onTap: () => Get.toNamed(Routes.S_KELAHIRAN),
                          //         child: Column(
                          //           children: [
                          //             Text("Surat"),
                          //             Text("Kelahiran")
                          //           ],
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 20,
                          // ),
                          // Container(
                          //   height: 130,
                          //   width: 130,
                          //   decoration: BoxDecoration(
                          //       color: white,
                          //       borderRadius: BorderRadius.circular(10)),
                          //   child: Column(
                          //     children: [
                          //       Padding(
                          //         padding: const EdgeInsets.all(8.0),
                          //         child: Container(
                          //             height: 70,
                          //             width: 70,
                          //             child: InkWell(
                          //               onTap: () =>
                          //                   Get.toNamed(Routes.S_KONTRAK),
                          //               child: Image.asset(
                          //                 "images/kontrak.png",
                          //                 fit: BoxFit.cover,
                          //               ),
                          //             )),
                          //       ),
                          //       SizedBox(
                          //         height: 5,
                          //       ),
                          //       InkWell(
                          //         onTap: () => Get.toNamed(Routes.S_KONTRAK),
                          //         child: Column(
                          //           children: [
                          //             Text("Surat"),
                          //             Text("Kontrak Rumah")
                          //           ],
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 20,
                          // ),
                          // Container(
                          //   height: 130,
                          //   width: 130,
                          //   decoration: BoxDecoration(
                          //       color: white,
                          //       borderRadius: BorderRadius.circular(10)),
                          //   child: Column(
                          //     children: [
                          //       Padding(
                          //         padding: const EdgeInsets.all(8.0),
                          //         child: Container(
                          //             height: 70,
                          //             width: 70,
                          //             child: InkWell(
                          //               onTap: () =>
                          //                   Get.toNamed(Routes.S_ACARA),
                          //               child: Image.asset(
                          //                 "images/acara.png",
                          //                 fit: BoxFit.cover,
                          //               ),
                          //             )),
                          //       ),
                          //       SizedBox(
                          //         height: 5,
                          //       ),
                          //       InkWell(
                          //         onTap: () => Get.toNamed(Routes.S_ACARA),
                          //         child: Column(
                          //           children: [
                          //             Text("Surat"),
                          //             Text("Izin Acara")
                          //           ],
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                           // Container(
                          //   height: 130,
                          //   width: 130,
                          //   decoration: BoxDecoration(
                          //       color: white,
                          //       borderRadius: BorderRadius.circular(10)),
                          //   child: Column(
                          //     children: [
                          //       Padding(
                          //         padding: const EdgeInsets.all(8.0),
                          //         child: Container(
                          //             height: 70,
                          //             width: 70,
                          //             child: InkWell(
                          //               onTap: () =>
                          //                   Get.toNamed(Routes.S_KEMATIAN),
                          //               child: Image.asset(
                          //                 "images/kematian.png",
                          //                 fit: BoxFit.cover,
                          //               ),
                          //             )),
                          //       ),
                          //       SizedBox(
                          //         height: 5,
                          //       ),
                          //       InkWell(
                          //         onTap: () => Get.toNamed(Routes.S_KEMATIAN),
                          //         child: Column(
                          //           children: [Text("Surat"), Text("Kematian")],
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 20,
                          // ),
                          // Container(
                          //   height: 130,
                          //   width: 130,
                          //   decoration: BoxDecoration(
                          //       color: white,
                          //       borderRadius: BorderRadius.circular(10)),
                          //   child: Column(
                          //     children: [
                          //       Padding(
                          //         padding: const EdgeInsets.all(8.0),
                          //         child: Container(
                          //             height: 70,
                          //             width: 70,
                          //             child: InkWell(
                          //               onTap: () =>
                          //                   Get.toNamed(Routes.S_USAHA),
                          //               child: Image.asset(
                          //                 "images/usaha.png",
                          //                 fit: BoxFit.cover,
                          //               ),
                          //             )),
                          //       ),
                          //       SizedBox(
                          //         height: 5,
                          //       ),
                          //       InkWell(
                          //         onTap: () => Get.toNamed(Routes.S_USAHA),
                          //         child: Column(
                          //           children: [
                          //             Text("Surat"),
                          //             Text("Izin Usaha")
                          //           ],
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 20,
                          // ),