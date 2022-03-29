import 'package:erte/app/const/color.dart';
import 'package:erte/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  GlobalKey<FormState> form = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Login & Register'),
      //   // centerTitle: true,
      // ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Obx(
              () => Form(
                key: form,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Container(
            height: 90,
            width: 130,
            child: Image.asset("images/erte.png", fit: BoxFit.fitWidth,)),),
                    SizedBox(height: 10,),
                    Container(
                      height: 300,
                      width: 300,
                      child: Lottie.asset("images/login.json", fit: BoxFit.cover),

                    ),
                    SizedBox(height: 10,),
                    controller.isRegis
                    ? Center(child: Text("Register", style: TextStyle(fontSize:20, fontWeight: FontWeight.bold, color: primary)))
                    : Center(child: Text("Login", style: TextStyle(fontSize:20, fontWeight: FontWeight.bold, color: primary))),
                    SizedBox(
                            height: 20,
                          ),
                    Container(
                      child: Column(children: [
                        if (controller.isRegis)
                          AppTextField(
                              textFieldType: TextFieldType.NAME,
                              showCursor: true,
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              controller: controller.nameC,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(),
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
                                border: OutlineInputBorder(),
                              )),
                        if (controller.isRegis)
                          SizedBox(
                            height: 20,
                          ),
                        AppTextField(
                            textFieldType: TextFieldType.EMAIL,
                            isValidationRequired: true,
                            showCursor: true,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            controller: controller.emailC,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(),
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
                              border: OutlineInputBorder(),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        AppTextField(
                            textFieldType: TextFieldType.PASSWORD,
                            showCursor: true,
                            keyboardType: TextInputType.visiblePassword,
                            controller: controller.passwordC,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(),
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
                              border: OutlineInputBorder(),
                            )),
                      ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // if (controller.isRegis)
                    //   ListTile(
                    //     leading: Container(
                    //         width: 24,
                    //         alignment: Alignment.centerLeft,
                    //         child: Icon(
                    //           Icons.calendar_today,
                    //         )),
                    //     onTap: () async =>
                    //         await controller.handleBirthDate(context),
                    //     title: Text(
                    //       "Birth Date",
                    //     ),
                    //     subtitle: Text(controller.selectedDate is DateTime
                    //         ? DateFormat("EEE, dd MMM y")
                    //             .format(controller.selectedDate!)
                    //         : '--'),
                    //   ),
                    // if (controller.isRegis)
                    //   Divider(
                    //     height: 0,
                    //     thickness: 1,
                    //   ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // if (controller.isRegis)
                    //   FormField<int>(
                    //     validator: (value) => controller.selectedGender > 0
                    //         ? null
                    //         : "This field is required",
                    //     builder: (gender) => Obx(
                    //       () => ListTile(
                    //         visualDensity: VisualDensity.compact,
                    //         title: Text("Gender"),
                    //         shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(15)),
                    //         subtitle: Column(
                    //           children: [
                    //             Row(
                    //               children: [
                    //                 Expanded(
                    //                   child: RadioListTile<int>(
                    //                     value: 1,
                    //                     groupValue: controller.selectedGender,
                    //                     onChanged: (value) => controller
                    //                         .selectedGender = value ?? 0,
                    //                     title: Text("Male"),
                    //                   ),
                    //                 ),
                    //                 Expanded(
                    //                   child: RadioListTile<int>(
                    //                     value: 2,
                    //                     groupValue: controller.selectedGender,
                    //                     onChanged: (value) => controller
                    //                         .selectedGender = value ?? 0,
                    //                     title: Text("Female"),
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //             if (gender.hasError)
                    //               Align(
                    //                 alignment: Alignment.centerLeft,
                    //                 child: Text(
                    //                   gender.errorText!,
                    //                 ),
                    //               ),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    SizedBox(
                      height: 20,
                    ),
                    controller.isRegis 
                    ?
                    Obx(
                      () => AppButton(
                        color: primary,
                        textColor: white,
                        shapeBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        width: Get.width,
                        text: controller.isSaving ? "Loading..." : "Daftar",
                        child: controller.isSaving ? Text("Loading...") : null,
                        onTap: controller.isSaving
                            ? null
                            : () async {
                                if (form.currentState!.validate()) {
                                  controller.isSaving = true;
                                  controller.isRegis
                                      ? await controller.register()
                                      : await controller.login();
                                  controller.isSaving = false;
                                }
                              },
                      ),
                    )
                    :
                    Obx(
                      () => AppButton(
                        color: primary,
                        textColor: white,
                        shapeBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        width: Get.width,
                        text: controller.isSaving ? "Loading..." : "Masuk",
                        child: controller.isSaving ? Text("Loading...") : null,
                        onTap: controller.isSaving
                            ? null
                            : () async {
                                if (form.currentState!.validate()) {
                                  controller.isSaving = true;
                                  controller.isRegis
                                      ? await controller.register()
                                      : await controller.login();
                                  controller.isSaving = false;
                                }
                              },
                      ),
                    ),

                    SizedBox(height: 15,),
                    TextButton(
                      onPressed: () {
                        controller.isRegis = !controller.isRegis;
                        controller.nameC.clear();
                        controller.passwordC.clear();
                        controller.emailC.clear();
                      },
                      style: ButtonStyle(visualDensity: VisualDensity.compact),
                      child: Text(controller.isRegis
                          ? "Sudah Punya Akun? Login Disini!"
                          : "Belum Punya Akun? Register!", style: TextStyle(color: primary)),
                    ),
                    TextButton(
                        child: Text("Lupa Password?", style: TextStyle(color: primary)),
                        onPressed: () => Get.toNamed(Routes.RESET),
                      ),
                    SizedBox(height: 20,),
                    TextButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.person, color: primary,),
                            SizedBox(width: 5,),
                            Text("Masuk sebagai guest",style: TextStyle(color: primary)),
                          ],
                        ),
                        onPressed: () => Get.offAndToNamed(Routes.HOME),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
