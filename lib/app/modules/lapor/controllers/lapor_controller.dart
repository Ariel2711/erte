import 'dart:io';
import 'package:erte/app/data/models/lapor.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LaporController extends GetxController {
  late File image;
  var imagePath = ''.obs;
  late TextEditingController judulC;
  late TextEditingController deskripsiC;
  late TextEditingController namaC;
  Future pickImage() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      File file = File(result.files.single.path!);
      imagePath.value = file.path;
    }
  }

  var _isSaving = false.obs;
  bool get isSaving => _isSaving.value;
  set isSaving(bool value) => _isSaving.value = value;

  Future store(Lapor lapor) async {
    isSaving = true;
    lapor.nama = namaC.text;
    lapor.judul = judulC.text;
    lapor.deskripsi = deskripsiC.text;
    if (lapor.id == null) {
      lapor.waktu = DateTime.now();
    }
    try {
      await lapor.save(
          file: imagePath.value == '' ? null : File(imagePath.value));
      Get.defaultDialog(
          title: "Berhasil",
          textConfirm: "Okay",
          onConfirm: () {
            namaC.clear();
            deskripsiC.clear();
            judulC.clear();
            Get.back();
          });
    } catch (e) {
      print(e);
    } finally {
      isSaving = false;
    }
  }

  @override
  void onInit() {
    namaC = TextEditingController();
    judulC = TextEditingController();
    deskripsiC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    namaC.clear();
    deskripsiC.clear();
    judulC.clear();
    super.onClose();
  }
}
