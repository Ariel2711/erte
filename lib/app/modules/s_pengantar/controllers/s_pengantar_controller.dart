import 'package:erte/app/const/color.dart';
import 'package:erte/app/data/models/absen.dart';
import 'package:erte/app/data/models/s_pengantar.dart';
import 'package:erte/app/data/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class SPengantarController extends GetxController {
  late TextEditingController namaC;
  late TextEditingController tempatC;
  late TextEditingController pekerjaanC;
  late TextEditingController nikC;
  late TextEditingController kkC;
  late TextEditingController alamatC;
  late TextEditingController keperluanC;
  UserModel? selectedUser;
  late TextEditingController emailC;

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
            // initialDatePickerMode: DatePickerMode.year,
            firstDate: DateTime(1900),
            lastDate: DateTime(2050)) ??
        selectedTanggal;
  }

  var _selectedKelamin = ''.obs;
  String get selectedKelamin => _selectedKelamin.value;
  set selectedKelamin(String value) => _selectedKelamin.value = value;

  var _selectedWNI = ''.obs;
  String get selectedWNI => _selectedWNI.value;
  set selectedWNI(String value) => _selectedWNI.value = value;

  List<String> listAgama = [
    "Islam",
    "Katholik",
    "Kristen",
    "Hindu",
    "Budha",
    "Konghucu"
  ];
  String? selectedAgama;

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

  List<String> listStatus = [
    "Belum Kawin",
    "Kawin",
    "Cerai Hidup",
    "Cerai Mati",
  ];
  String? selectedStatus;

  List<String> listPendidikan = [
    "SD",
    "SLTP",
    "SLTA",
    "SMK",
    "SI",
    "SII",
    "Sederajat"
  ];
  String? selectedPendidikan;

  var _isSaving = false.obs;
  bool get isSaving => _isSaving.value;
  set isSaving(bool value) => _isSaving.value = value;

  // modelToController(Pengantar pengantar) {
  //   namaC.text = pengantar.nama ?? '';
  //   tempatC.text = pengantar.tempatlahir ?? '';
  //   pekerjaanC.text = pengantar.pekerjaan ?? '';
  //   alamatC.text = pengantar.alamat ?? '';
  //   keperluanC.text = pengantar.keperluan ?? '';
  //   nikC.text = pengantar.nik?.toString() ?? '';
  //   kkC.text = pengantar.kk?.toString() ?? '';
  //   selectedAgama = pengantar.agama;
  //   selectedKelamin = pengantar.kelamin ?? '';
  //   selectedTanggal = pengantar.tanggallahir ?? DateTime.now();
  //   selectedPendidikan = pengantar.pekerjaan;
  //   selectedStatus = pengantar.status;
  //   selectedWNI = pengantar.wni ?? '';
  // }

  Future store(Pengantar pengantar) async {
    isSaving = true;
    pengantar.nama = namaC.text;
    pengantar.pekerjaan = pekerjaanC.text;
    pengantar.agama = selectedAgama;
    pengantar.pendidikan = selectedPendidikan;
    pengantar.status = selectedStatus;
    pengantar.alamat = alamatC.text;
    pengantar.keperluan1 = selectedKeperluan1;
    pengantar.keperluan2 = selectedKeperluan2;
    pengantar.wni = selectedWNI;
    pengantar.kelamin = selectedKelamin;
    pengantar.nik = int.tryParse(nikC.text);
    pengantar.kk = int.tryParse(kkC.text);
    pengantar.tanggallahir = selectedTanggal;
    pengantar.tempatlahir = tempatC.text;
    pengantar.email = emailC.text;
    if (pengantar.id == null) {
      pengantar.waktu = DateTime.now();
    }
    try {
      await pengantar.save();
      Get.defaultDialog(
          title: "Berhasil",
          textConfirm: "Oke",
          onConfirm: () {
            namaC.clear();
            pekerjaanC.clear();
            tempatC.clear();
            nikC.clear();
            kkC.clear();
            alamatC.clear();
            keperluanC.clear();
            selectedAgama = '';
            selectedKelamin = '';
            selectedPendidikan = '';
            selectedStatus = '';
            selectedWNI = '';
            selectedTanggal = DateTime.now();
            Get.back();
            Get.back();
            emailC.clear();
          },
          buttonColor: primary,
          cancelTextColor: primary,
          confirmTextColor: white,
          titleStyle: TextStyle(color: primary),
          middleTextStyle: TextStyle(color: primary));
    } catch (e) {
      print(e);
    } finally {
      isSaving = false;
    }
  }

  Future storeabsen(Absen absen) async {
    isSaving = true;
    absen.nama = namaC.text;
    absen.alamat = alamatC.text;
    absen.email = emailC.text;
    if (absen.id == null) {
      absen.waktu = DateTime.now();
    }
    try {
      await absen.save();
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
    pekerjaanC = TextEditingController();
    nikC = TextEditingController();
    kkC = TextEditingController();
    alamatC = TextEditingController();
    keperluanC = TextEditingController();
    rxUser.bindStream(UserModel().allstreamList());
    emailC = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    namaC.clear();
    pekerjaanC.clear();
    tempatC.clear();
    nikC.clear();
    kkC.clear();
    alamatC.clear();
    keperluanC.clear();
    selectedAgama = '';
    selectedKelamin = '';
    selectedPendidikan = '';
    selectedStatus = '';
    selectedWNI = '';
    emailC.clear();
    selectedTanggal = DateTime.now();
  }
}
