import 'dart:io';

import 'package:erte/app/data/models/form_kk.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormKkController extends GetxController {
  late TextEditingController namalengkapC;
  late TextEditingController namakepalaC;
  late TextEditingController namasponsorC;
  late TextEditingController namaayahC;
  late TextEditingController namaibuC;
  late TextEditingController kodeposC;
  late TextEditingController jumkeluargaC;
  late TextEditingController teleponC;
  late TextEditingController gelardepanC;
  late TextEditingController gelarbelakangC;
  late TextEditingController nopasporC;
  late TextEditingController tempatC;
  late TextEditingController pekerjaanC;
  late TextEditingController nikibuC;
  late TextEditingController nikayahC;
  late TextEditingController noitasC;
  late TextEditingController tempatItasC;
  late TextEditingController tempatPertamaC;
  late TextEditingController alamatC;
  late TextEditingController alamatsponsorC;
  late TextEditingController rtC;
  late TextEditingController rwC;
  late TextEditingController nowaliC;
  late TextEditingController noaktalahirC;
  late TextEditingController noaktakawinC;
  late TextEditingController noaktaceraiC;
  late TextEditingController orgagamaC;
  late TextEditingController kewarganegaraanC;

  Rx<DateTime?> _selectedTanggallahir = DateTime.now().obs;
  DateTime? get selectedTanggallahir => _selectedTanggallahir.value;
  set selectedTanggallahir(DateTime? value) =>
      _selectedTanggallahir.value = value;

  tanggalLahir(dynamic context) async {
    selectedTanggallahir = await showDatePicker(
            context: context,
            initialDate: selectedTanggallahir ?? DateTime.now(),
            // initialDatePickerMode: DatePickerMode.year,
            firstDate: DateTime(1900),
            lastDate: DateTime(2050)) ??
        selectedTanggallahir;
  }

  Rx<DateTime?> _selectedTanggalItas = DateTime.now().obs;
  DateTime? get selectedTanggalItas => _selectedTanggalItas.value;
  set selectedTanggalItas(DateTime? value) =>
      _selectedTanggalItas.value = value;

  tanggalItas(dynamic context) async {
    selectedTanggalItas = await showDatePicker(
            context: context,
            initialDate: selectedTanggalItas ?? DateTime.now(),
            // initialDatePickerMode: DatePickerMode.year,
            firstDate: DateTime(1900),
            lastDate: DateTime(2050)) ??
        selectedTanggalItas;
  }

  Rx<DateTime?> _selectedTanggalTerbitItas = DateTime.now().obs;
  DateTime? get selectedTanggalTerbitItas => _selectedTanggalTerbitItas.value;
  set selectedTanggalTerbitItas(DateTime? value) =>
      _selectedTanggalTerbitItas.value = value;

  tanggalTerbitItas(dynamic context) async {
    selectedTanggalTerbitItas = await showDatePicker(
            context: context,
            initialDate: selectedTanggalTerbitItas ?? DateTime.now(),
            // initialDatePickerMode: DatePickerMode.year,
            firstDate: DateTime(1900),
            lastDate: DateTime(2050)) ??
        selectedTanggalTerbitItas;
  }

  Rx<DateTime?> _selectedTanggalkawin = DateTime.now().obs;
  DateTime? get selectedTanggalkawin => _selectedTanggalkawin.value;
  set selectedTanggalkawin(DateTime? value) =>
      _selectedTanggalkawin.value = value;

  tanggalkawin(dynamic context) async {
    selectedTanggalkawin = await showDatePicker(
            context: context,
            initialDate: selectedTanggalkawin ?? DateTime.now(),
            // initialDatePickerMode: DatePickerMode.year,
            firstDate: DateTime(1900),
            lastDate: DateTime(2050)) ??
        selectedTanggalkawin;
  }

  Rx<DateTime?> _selectedTanggalcerai = DateTime.now().obs;
  DateTime? get selectedTanggalcerai => _selectedTanggalcerai.value;
  set selectedTanggalcerai(DateTime? value) =>
      _selectedTanggalcerai.value = value;

  tanggalcerai(dynamic context) async {
    selectedTanggalcerai = await showDatePicker(
            context: context,
            initialDate: selectedTanggalcerai ?? DateTime.now(),
            // initialDatePickerMode: DatePickerMode.year,
            firstDate: DateTime(1900),
            lastDate: DateTime(2050)) ??
        selectedTanggalcerai;
  }

  Rx<DateTime?> _selectedTanggalpaspor = DateTime.now().obs;
  DateTime? get selectedTanggalpaspor => _selectedTanggalpaspor.value;
  set selectedTanggalpaspor(DateTime? value) =>
      _selectedTanggalpaspor.value = value;

  tanggalPaspor(dynamic context) async {
    selectedTanggalpaspor = await showDatePicker(
            context: context,
            initialDate: selectedTanggalpaspor ?? DateTime.now(),
            // initialDatePickerMode: DatePickerMode.year,
            firstDate: DateTime(1900),
            lastDate: DateTime(2050)) ??
        selectedTanggalpaspor;
  }

  Rx<DateTime?> _selectedTanggalpertama = DateTime.now().obs;
  DateTime? get selectedTanggalpertama => _selectedTanggalpertama.value;
  set selectedTanggalpertama(DateTime? value) =>
      _selectedTanggalpertama.value = value;

  tanggalPertama(dynamic context) async {
    selectedTanggalpertama = await showDatePicker(
            context: context,
            initialDate: selectedTanggalpertama ?? DateTime.now(),
            // initialDatePickerMode: DatePickerMode.year,
            firstDate: DateTime(1900),
            lastDate: DateTime(2050)) ??
        selectedTanggalpertama;
  }

  var _selectedKelamin = ''.obs;
  String get selectedKelamin => _selectedKelamin.value;
  set selectedKelamin(String value) => _selectedKelamin.value = value;

  var _selectedWNI = ''.obs;
  String get selectedWNI => _selectedWNI.value;
  set selectedWNI(String value) => _selectedWNI.value = value;

  var _selectedAktalahir = ''.obs;
  String get selectedAktalahir => _selectedAktalahir.value;
  set selectedAktalahir(String value) => _selectedAktalahir.value = value;

  var _selectedAktakawin = ''.obs;
  String get selectedAktakawin => _selectedAktakawin.value;
  set selectedAktakawin(String value) => _selectedAktakawin.value = value;

  var _selectedAktacerai = ''.obs;
  String get selectedAktacerai => _selectedAktacerai.value;
  set selectedAktacerai(String value) => _selectedAktacerai.value = value;

  var _selectedCacat = ''.obs;
  String get selectedCacat => _selectedCacat.value;
  set selectedCacat(String value) => _selectedCacat.value = value;

  var _selectedDataKeluarga = ''.obs;
  String get selectedDataKeluarga => _selectedDataKeluarga.value;
  set selectedDataKeluarga(String value) => _selectedDataKeluarga.value = value;

  List<String> listPendidikan = [
    "Tidak/Belum Sekolah",
    "Belum Tamat SD/Sederajat",
    "Tamat SD/Sederajat",
    "SLTP/Sederajat",
    "SLTA/Sederajat",
    "Diploma VII",
    "Akademi/Diploma III/Sarjana Muda",
    "Diploma IV/Strata I/Strata II",
    "Strata III",
    "Lainnya"
  ];
  String? selectedPendidikan;

  List<String> listAgama = [
    "Islam",
    "Katholik",
    "Kristen",
    "Hindu",
    "Budha",
    "Konghucu"
  ];
  String? selectedAgama;

  List<String> listJenisCacat = [
    "Cacat Fisik",
    "Cacat Netra/Buta",
    "Cacat Rungu/Bicara",
    "Cacat Mental/Jiwa",
    "Cacat Fisik dan Mental",
    "Cacat Lainnya"
  ];
  String? selectedJenisCacat;

  List<String> listHubungan = [
    "Kepala Keluarga",
    "Suami",
    "Istri",
    "Anak",
    "Menantu",
    "Cucu",
    "Orang Tua",
    "Mertua",
    "Famili",
    "Lainnya"
  ];
  String? selectedHubungan;

  List<String> listSponsor = [
    "Organisasi Internasional",
    "Pemerintah",
    "Perusahaan",
    "Perorangan",
  ];
  String? selectedSponsor;

  List<String> listStatus = [
    "Belum Kawin",
    "Kawin Tercatat",
    "Kawin Belum Tercatat",
    "Cerai Hidup Tercatat",
    "Cerai Hidup Belum Tercatat",
    "Cerai Mati",
  ];
  String? selectedStatus;

  List<String> listGoldarah = [
    "A",
    "B",
    "AB",
    "O",
  ];
  String? selectGoldarah;

  List<String> listPekerjaan = [
    "A",
    "B",
    "AB",
    "O",
  ];
  String? selectedPekerjaan;

  late File image;
  var imagePath = ''.obs;

  var _isSaving = false.obs;
  bool get isSaving => _isSaving.value;
  set isSaving(bool value) => _isSaving.value = value;

  Future pickImage() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      File file = File(result.files.single.path!);
      imagePath.value = file.path;
    }
  }

  // modelToController(kk kk) {
  //   namaC.text = kk.nama ?? '';
  //   tempatC.text = kk.tempatlahir ?? '';
  //   pekerjaanC.text = kk.pekerjaan ?? '';
  //   alamatC.text = kk.alamat ?? '';
  //   nikC.text = kk.nik?.toString() ?? '';
  //   selectedAgama = kk.agama;
  //   selectedKelamin = kk.kelamin ?? '';
  //   selectedTanggal = kk.tanggallahir ?? DateTime.now();
  //   selectedPendidikan = kk.pekerjaan;
  //   selectedStatus = kk.status;
  //   selectedWNI = kk.wni ?? '';
  //   rtC.text = kk.rt ?? '';
  //   rwC.text = kk.rw ?? '';
  //   kelurahanC.text = kk.kelurahan ?? '';
  //   kecamatanC.text = kk.kecamatan ?? '';
  //   selectGoldarah = kk.goldarah ?? '';
  // }

  Future store(KK kk) async {
    isSaving = true;
    kk.datakeluarga = selectedDataKeluarga;
    kk.jumkeluarga = int.tryParse(jumkeluargaC.text);
    kk.namakepala = namakepalaC.text;
    kk.namalengkap = namalengkapC.text;
    kk.gelarbelakang = gelarbelakangC.text;
    kk.gelardepan = gelardepanC.text;
    kk.nopaspor = nopasporC.text;
    kk.tanggalpaspor = selectedTanggalpaspor;
    kk.namasponsor = namasponsorC.text;
    kk.tipesponsor = selectedSponsor;
    kk.alamatsponsor = alamatsponsorC.text;
    kk.kodeppos = int.tryParse(kodeposC.text);
    kk.telepon = int.tryParse(teleponC.text);
    kk.pekerjaan = selectedPekerjaan;
    kk.agama = selectedAgama;
    kk.statuskawin = selectedStatus;
    kk.alamat = alamatC.text;
    kk.wni = selectedWNI;
    kk.kelamin = selectedKelamin;
    kk.nikibu = int.tryParse(nikibuC.text);
    kk.tanggallahir = selectedTanggallahir;
    kk.tempatlahir = tempatC.text;
    kk.kewarganegaraan = kewarganegaraanC.text;
    kk.nowali = int.tryParse(nowaliC.text);
    kk.rt = int.tryParse(rtC.text);
    kk.rw = int.tryParse(rwC.text);
    kk.goldarah = selectGoldarah;
    kk.aktalahir = selectedAktalahir;
    kk.noakta = noaktalahirC.text;
    kk.orgagama = orgagamaC.text;
    kk.aktakawin = selectedAktakawin;
    kk.tanggalkawin = selectedTanggalkawin;
    kk.aktacerai = selectedAktacerai;
    kk.noaktacerai = noaktaceraiC.text;
    kk.tanggalcerai = selectedTanggalcerai;
    kk.statuskeluarga = selectedHubungan;
    kk.cacat = selectedCacat;
    kk.jeniscacat = selectedJenisCacat;
    kk.pendidikan = selectedPendidikan;
    kk.noitas = noitasC.text;
    kk.tempatitas = tempatItasC.text;
    kk.tanggalterbititas = selectedTanggalTerbitItas;
    kk.tanggalitas = selectedTanggalItas;
    kk.tempatpertama = tempatPertamaC.text;
    kk.tanggalpertama = selectedTanggalpertama;
    kk.nikayah = int.tryParse(nikayahC.text);
    kk.namaibu = namaibuC.text;
    kk.namaayah = namaayahC.text;

    if (kk.id == null) {
      kk.waktu = DateTime.now();
    }
    try {
      await kk.save();
      Get.defaultDialog(
          title: "Berhasil",
          textConfirm: "Okay",
          onConfirm: () {
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
    namalengkapC = TextEditingController();
    namakepalaC = TextEditingController();
    namasponsorC = TextEditingController();
    namaayahC = TextEditingController();
    namaibuC = TextEditingController();
    kodeposC = TextEditingController();
    jumkeluargaC = TextEditingController();
    teleponC = TextEditingController();
    gelardepanC = TextEditingController();
    gelarbelakangC = TextEditingController();
    nopasporC = TextEditingController();
    tempatC = TextEditingController();
    pekerjaanC = TextEditingController();
    nikibuC = TextEditingController();
    nikayahC = TextEditingController();
    noitasC = TextEditingController();
    tempatItasC = TextEditingController();
    tempatPertamaC = TextEditingController();
    alamatC = TextEditingController();
    alamatsponsorC = TextEditingController();
    rtC = TextEditingController();
    rwC = TextEditingController();
    nowaliC = TextEditingController();
    noaktalahirC = TextEditingController();
    noaktakawinC = TextEditingController();
    noaktaceraiC = TextEditingController();
    orgagamaC = TextEditingController();
    kewarganegaraanC = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    namalengkapC.clear();
    namakepalaC.clear();
    namasponsorC.clear();
    namaayahC.clear();
    namaibuC.clear();
    kodeposC.clear();
    jumkeluargaC.clear();
    teleponC.clear();
    gelardepanC.clear();
    gelarbelakangC.clear();
    nopasporC.clear();
    tempatC.clear();
    pekerjaanC.clear();
    nikibuC.clear();
    nikayahC.clear();
    noitasC.clear();
    tempatItasC.clear();
    tempatPertamaC.clear();
    alamatC.clear();
    alamatsponsorC.clear();
    rtC.clear();
    rwC.clear();
    nowaliC.clear();
    noaktalahirC.clear();
    noaktakawinC.clear();
    noaktaceraiC.clear();
    orgagamaC.clear();
    kewarganegaraanC.clear();
  }
}
