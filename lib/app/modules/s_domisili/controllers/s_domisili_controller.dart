import 'package:erte/app/data/models/s_domisili.dart';
import 'package:erte/app/data/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SDomisiliController extends GetxController {
  late TextEditingController namaC;
  late TextEditingController tempatC;
  late TextEditingController nktpC;
  late TextEditingController alamatC;
  UserModel? selectedUser;

  List<String> listKeperluan1 = [
    "Pengurusan Surat Pindah",
    "Pengurusan Surat Datang",
    "Surat Kontrak Rumah",
    "Pengurusan Surat Kelahiran",
    "Pengurusan Surat Kematian",
    "Surat Keterangan Tidak Mampu",
    "Surat Pernyataan Waris",
    "Surat Ijin Keramaian",
    "Pengurusan Surat Ijin Usaha",
    "Pengantar Surat Nikah",
    "Pengurusan Surat Pensiun",
    "Surat Keterangan Penghasilan",
    "Surat Keterangan Permohonan KPR",
    "Surat Keterangan Bersih Diri",
    "Surat Keterangan Catatan Kepolisian",
    "Surat Tunjangan Keluarga",
    "Surat Pengurusan Paspor",
    "Surat Keterangan Domisili",
    "Surat Boro Kerja",
    "Pengurusan KTP Baru",
    "Pengurusan KK Baru",
    "Surat Ijin Mendirikan Bangunan"
  ];
  String? selectedKeperluan1;

  List<String> listKeperluan2 = [
    "Pengurusan Surat Pindah",
    "Pengurusan Surat Datang",
    "Surat Kontrak Rumah",
    "Pengurusan Surat Kelahiran",
    "Pengurusan Surat Kematian",
    "Surat Keterangan Tidak Mampu",
    "Surat Pernyataan Waris",
    "Surat Ijin Keramaian",
    "Pengurusan Surat Ijin Usaha",
    "Pengantar Surat Nikah",
    "Pengurusan Surat Pensiun",
    "Surat Keterangan Penghasilan",
    "Surat Keterangan Permohonan KPR",
    "Surat Keterangan Bersih Diri",
    "Surat Keterangan Catatan Kepolisian",
    "Surat Tunjangan Keluarga",
    "Surat Pengurusan Paspor",
    "Surat Keterangan Domisili",
    "Surat Boro Kerja",
    "Pengurusan KTP Baru",
    "Pengurusan KK Baru",
    "Surat Ijin Mendirikan Bangunan"
  ];
  String? selectedKeperluan2;

  RxList<UserModel> rxUser = RxList<UserModel>();
  List<UserModel> get users => rxUser.value;
  set users(List<UserModel> value) => rxUser.value = value;

  Rx<DateTime?> _selectedTanggal = DateTime.now().obs;
  DateTime? get selectedTanggal => _selectedTanggal.value;
  set selectedTanggal(DateTime? value) => _selectedTanggal.value = value;

  tanggalLahir(dynamic context) async {
    selectedTanggal = await showDatePicker(
            context: context,
            initialDate: selectedTanggal ?? DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2050)) ??
        selectedTanggal;
  }

  var _selectedKelamin = ''.obs;
  String get selectedKelamin => _selectedKelamin.value;
  set selectedKelamin(String value) => _selectedKelamin.value = value;

  var _isSaving = false.obs;
  bool get isSaving => _isSaving.value;
  set isSaving(bool value) => _isSaving.value = value;

  Future store(Domisili domisili) async {
    isSaving = true;
    domisili.nama = namaC.text;
    domisili.alamat = alamatC.text;
    domisili.keperluan1 = selectedKeperluan1;
    domisili.keperluan2 = selectedKeperluan2;
    domisili.kelamin = selectedKelamin;
    domisili.nktp = int.tryParse(nktpC.text);
    domisili.tanggallahir = selectedTanggal;
    domisili.tempatlahir = tempatC.text;
    if (domisili.id == null) {
      domisili.waktu = DateTime.now();
    }
    try {
      await domisili.save();
      Get.defaultDialog(
          title: "Berhasil",
          textConfirm: "Okay",
          onConfirm: () {
            namaC.clear();
            tempatC.clear();
            nktpC.clear();
            alamatC.clear();
            selectedKelamin = '';
            selectedKeperluan1 = '';
            selectedKeperluan2 = '';
            selectedTanggal = DateTime.now();
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
    super.onInit();
    namaC = TextEditingController();
    tempatC = TextEditingController();
    nktpC = TextEditingController();
    alamatC = TextEditingController();
    rxUser.bindStream(UserModel().allstreamList());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    namaC.clear();
    tempatC.clear();
    nktpC.clear();
    alamatC.clear();
    selectedKelamin = '';
    selectedKeperluan1 = '';
    selectedKeperluan2 = '';
    selectedTanggal = DateTime.now();
  }
}
