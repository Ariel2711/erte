import 'package:avatar_glow/avatar_glow.dart';
import 'package:erte/app/const/color.dart';
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
        // appBar: AppBar(
        //     title: Text('ERTE'),
        //     // centerTitle: true,
        //     actions: [
        //       // IconButton(
        //       //     onPressed: () => Get.toNamed(Routes.PROFIL),
        //       //     icon: Icon(Icons.person))
        //       Center(child: Text("${DateFormat.yMMMEd().format(DateTime.now())}"))
        //     ],
        //   ),
        drawer: Drawer(
          backgroundColor: white,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: double.infinity,
              height: 155,
              color: blue,
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
                                      color: blue,
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
                          style: TextStyle(color: white, fontSize: 20),
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
                          ListTile(
                            onTap: () => Get.toNamed(Routes.PROFIL),
                            leading: Icon(
                              Icons.person,
                              color: blue,
                            ),
                            title: Text(
                              "Profil",
                              style: TextStyle(color: blue),
                            ),
                          ),
                          // ListTile(
                          //   onTap: () => Get.defaultDialog(
                          //     title: "Notifications",
                          //     middleText: "This is Notifications",
                          //     titleStyle: TextStyle(color: blue),
                          //     middleTextStyle: TextStyle(color: blue),
                          //     textConfirm: "Okay",
                          //     onConfirm: () => Get.back(),
                          //     confirmTextColor: white,
                          //     buttonColor: blue,
                          //   ),
                          //   leading: Icon(
                          //     Icons.notifications,
                          //     color: blue,
                          //   ),
                          //   title: Text(
                          //     "Notifications",
                          //     style: TextStyle(color: blue),
                          //   ),
                          // ),
                          // ListTile(
                          //   onTap: () => Get.defaultDialog(
                          //     title: "Help",
                          //     middleText: "This is Help",
                          //     titleStyle: TextStyle(color: blue),
                          //     middleTextStyle: TextStyle(color: blue),
                          //     textConfirm: "Okay",
                          //     onConfirm: () => Get.back(),
                          //     confirmTextColor: white,
                          //     buttonColor: blue,
                          //   ),
                          //   leading: Icon(
                          //     Icons.info_outline,
                          //     color: blue,
                          //   ),
                          //   title: Text(
                          //     "Help",
                          //     style: TextStyle(color: blue),
                          //   ),
                          // ),
                          Obx(() =>
                              authC.user.id != null && authC.user.role == "User"
                                  ? ListTile(
                                      onTap: () => Get.toNamed(Routes.RIWAYAT),
                                      leading: Icon(
                                        Icons.history,
                                        color: blue,
                                      ),
                                      title: Text(
                                        "Riwayat",
                                        style: TextStyle(color: blue),
                                      ),
                                    )
                                  : Container()),
                          Obx(() => authC.user.role == "Admin"
                              ? ListTile(
                                  onTap: () => Get.toNamed(Routes.ADMIN),
                                  leading: Icon(
                                    Icons.notifications_active,
                                    color: blue,
                                  ),
                                  title: Text(
                                    "Surat Warga",
                                    style: TextStyle(color: blue),
                                  ),
                                )
                              : Container()),
                          Obx(() => authC.user.role == "Admin"
                              ? ListTile(
                                  onTap: () => Get.toNamed(Routes.LAPOR),
                                  leading: Icon(
                                    Icons.notifications,
                                    color: blue,
                                  ),
                                  title: Text(
                                    "Laporan Warga",
                                    style: TextStyle(color: blue),
                                  ),
                                )
                              : ListTile(
                                  onTap: () => Get.toNamed(Routes.LAPOR),
                                  leading: Icon(
                                    Icons.notifications,
                                    color: blue,
                                  ),
                                  title: Text(
                                    "Lapor RT",
                                    style: TextStyle(color: blue),
                                  ),
                                )),
                          Obx(
                            () => authC.user.id == null
                                ? ListTile(
                                    onTap: () => Get.toNamed(Routes.AUTH),
                                    leading: Icon(
                                      Icons.login,
                                      color: blue,
                                    ),
                                    title: Text(
                                      "Login",
                                      style: TextStyle(color: blue),
                                    ),
                                  )
                                : ListTile(
                                    onTap: () => authC.logout(),
                                    leading: Icon(
                                      Icons.logout,
                                      color: blue,
                                    ),
                                    title: Text(
                                      "Logout",
                                      style: TextStyle(color: blue),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                      // authC.user.id == null
                      // ? AppButton(
                      //   color: blue,
                      //   text: "Login",
                      //   textColor: white,
                      //   onTap: ()=> Get.toNamed(Routes.AUTH),
                      // )
                      // : AppButton(
                      //   color: blue,
                      //   text: "Logout",
                      //   textColor: white,
                      //   onTap: ()=> authC.logout(),
                      // )
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
                color: blue,
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
                                  "images/erte_putih.png",
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
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
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
                          Container(
                            height: 130,
                            width: 130,
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      height: 70,
                                      width: 70,
                                      child: InkWell(
                                        onTap: () =>
                                            Get.toNamed(Routes.S_PENGANTAR),
                                        child: Image.asset(
                                          "images/pernyataan.png",
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                InkWell(
                                  onTap: () => Get.toNamed(Routes.S_PENGANTAR),
                                  child: Column(
                                    children: [
                                      Text("Surat"),
                                      Text("Pengantar")
                                    ],
                                  ),
                                ),
                              ],
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
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      height: 70,
                                      width: 70,
                                      child: InkWell(
                                        onTap: () =>
                                            Get.toNamed(Routes.FORM_KK),
                                        child: Image.asset(
                                          "images/kk.png",
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                InkWell(
                                  onTap: () => Get.toNamed(Routes.FORM_KK),
                                  child: Column(
                                    children: [Text("Form"), Text("KK")],
                                  ),
                                ),
                              ],
                            ),
                          ),
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
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      Column(
                        children: [
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
                          Container(
                            height: 130,
                            width: 130,
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      height: 70,
                                      width: 70,
                                      child: InkWell(
                                        onTap: () =>
                                            Get.toNamed(Routes.S_DOMISILI),
                                        child: Image.asset(
                                          "images/domisili.png",
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                InkWell(
                                  onTap: () => Get.toNamed(Routes.S_DOMISILI),
                                  child: Column(
                                    children: [Text("Surat"), Text("Domisili")],
                                  ),
                                ),
                              ],
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
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      height: 70,
                                      width: 70,
                                      child: InkWell(
                                        onTap: () =>
                                            Get.toNamed(Routes.FORM_KTP),
                                        child: Image.asset(
                                          "images/ktp.png",
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                InkWell(
                                  onTap: () => Get.toNamed(Routes.FORM_KTP),
                                  child: Column(
                                    children: [Text("Form"), Text("KTP")],
                                  ),
                                ),
                              ],
                            ),
                          ),

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
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
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

// Padding(
        //   padding: const EdgeInsets.all(20),
        //   child: Center(
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: [
        //         TextButton(
        //             onPressed: () => Get.toNamed(Routes.S_PENGANTAR),
        //             child: Text("Surat Pengantar")),
        //         TextButton(
        //             onPressed: () => Get.toNamed(Routes.S_PERNYATAAN),
        //             child: Text("Surat Pernyataan")),
        //         TextButton(
        //             onPressed: () => Get.toNamed(Routes.FORM_KTP),
        //             child: Text("Form KTP")),
        //         Obx(
        //           () => authC.user.id == null
        //               ? AppButton(
        //                   text: "Login",
        //                   onTap: () => Get.toNamed(Routes.AUTH),
        //                 )
        //               : AppButton(
        //                   text: "Logout",
        //                   onTap: () => authC.logout(),
        //                 ),
        //         ),
        //       ],
        //     ),
        //   ),
        // )