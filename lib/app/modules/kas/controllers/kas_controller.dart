import 'package:erte/app/data/models/kas.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class KasController extends GetxController {
  late TextEditingController deskripsiC;
  late TextEditingController uangC;

  RxList<Kas> rxKas = RxList<Kas>();
  List<Kas> get kass => rxKas.value;
  set kass(List<Kas> value) => rxKas.value = value;

  modelToController(Kas kas) {
    uangC.text = kas.uang ?? '';
    deskripsiC.text = kas.deskripsi ?? '';
    selectedKategori = kas.kategori;
  }

  var _isSaving = false.obs;
  bool get isSaving => _isSaving.value;
  set isSaving(bool value) => _isSaving.value = value;

  List<String> listKategori = [
    "Pemasukan",
    "Pengeluaran",
  ];
  String? selectedKategori;

  Future store(Kas kas) async {
    isSaving = true;
    kas.kategori = selectedKategori;
    kas.deskripsi = deskripsiC.text;
    if (kas.id == null) {
      kas.waktu = DateTime.now();
    }
    try {
      await kas.save();
      Get.defaultDialog(
          title: "Berhasil",
          textConfirm: "Okay",
          onConfirm: () {
            deskripsiC.clear();
            uangC.clear();
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
    rxKas.bindStream(Kas().streamList());
    deskripsiC = TextEditingController();
    uangC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    deskripsiC.clear();
    selectedKategori = '';
    uangC.clear();
    super.onClose();
  }
}
