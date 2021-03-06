import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erte/app/data/database.dart';
import 'package:get/get.dart';

const String sid = "id";
const String snama = "nama";
const String skelamin = "kelamin";
const String stempatlahir = "tempatlahir";
const String stanggallahir = "tanggallahir";
const String sagama = "agama";
const String sstatus = "status";
const String swni = "wni";
const String spendidikan = "pendidikan";
const String spekerjaan = "pekerjaan";
const String snik = "nik";
const String skk = "kk";
const String salamat = "alamat";
const String skeperluan1 = "keperluan1";
const String skeperluan2 = "keperluan2";
const String swaktu = "waktu";
const String semail = "email";
const String snomer = "nomer";
const String sverifikasi = "verifikasi";

class Pengantar {
  String? id;
  String? nama;
  int? nomer;
  String? kelamin;
  String? tempatlahir;
  DateTime? tanggallahir;
  String? agama;
  String? status;
  String? wni;
  String? pendidikan;
  String? pekerjaan;
  int? nik;
  int? kk;
  String? alamat;
  String? keperluan1;
  String? keperluan2;
  DateTime? waktu;
  String? email;
  String? verifikasi;

  Pengantar(
      {this.id,
      this.nama,
      this.kelamin,
      this.tempatlahir,
      this.tanggallahir,
      this.agama,
      this.status,
      this.wni,
      this.pendidikan,
      this.pekerjaan,
      this.nik,
      this.kk,
      this.alamat,
      this.keperluan1,
      this.keperluan2,
      this.waktu,
      this.email,
      this.nomer,
      this.verifikasi});

  Pengantar fromJson(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data() as Map<String, dynamic>;
    return Pengantar(
      id: doc.id,
      nama: json[snama],
      kelamin: json[skelamin],
      tempatlahir: json[stempatlahir],
      tanggallahir: (json[stanggallahir] as Timestamp?)?.toDate(),
      agama: json[sagama],
      status: json[sstatus],
      wni: json[swni],
      pendidikan: json[spendidikan],
      pekerjaan: json[spekerjaan],
      nik: json[snik],
      kk: json[skk],
      nomer: json[snomer],
      alamat: json[salamat],
      keperluan1: json[skeperluan1],
      keperluan2: json[skeperluan2],
      waktu: (json[swaktu] as Timestamp?)?.toDate(),
      email: json[semail],
      verifikasi: json[sverifikasi],
    );
  }

  Pengantar.fromJson(DocumentSnapshot doc) {
    Map<String, dynamic>? json = doc.data() as Map<String, dynamic>?;
    id = doc.id;
      nama = json?[snama];
      kelamin = json?[skelamin];
      tempatlahir = json?[stempatlahir];
      tanggallahir = (json?[stanggallahir] as Timestamp?)?.toDate();
      agama = json?[sagama];
      status = json?[sstatus];
      wni = json?[swni];
      pendidikan = json?[spendidikan];
      pekerjaan = json?[spekerjaan];
      nik = json?[snik];
      kk = json?[skk];
      nomer = json?[snomer];
      alamat = json?[salamat];
      keperluan1 = json?[skeperluan1];
      keperluan2 = json?[skeperluan2];
      waktu = (json?[swaktu] as Timestamp?)?.toDate();
      email = json?[semail];
      verifikasi = json?[sverifikasi];
  }

  Map<String, dynamic> get toJson => {
        sid: id,
        snama: nama,
        skelamin: kelamin,
        stempatlahir: tempatlahir,
        stanggallahir: tanggallahir,
        sagama: agama,
        sstatus: status,
        swni: wni,
        spendidikan: pendidikan,
        spekerjaan: pekerjaan,
        snik: nik,
        skk: kk,
        salamat: alamat,
        skeperluan1: keperluan1,
        skeperluan2: keperluan2,
        swaktu: waktu,
        semail: email,
        snomer: nomer,
        sverifikasi: verifikasi,
      };

  Database db = Database(
      collectionReference: firestore.collection(
        pengantarCollection,
      ),
      storageReference: storage.ref(pengantarCollection));

  Future<Pengantar> save() async {
    id == null ? id = await db.add(toJson) : await db.edit(toJson);
    if (id != null) {
      db.edit(toJson);
    }
    return this;
  }

  Future<Pengantar> streamList() async {
    print("getStream");
    return await db.collectionReference
        .orderBy("waktu", descending: true)
        .get()
        .then((event) {
      if (event.docs.length > 0) {
        return fromJson(event.docs.first);
      } else {
        return Pengantar();
      }
    });
  }

  Stream<List<Pengantar>> streamallList() async* {
    yield* db.collectionReference
        .orderBy("waktu", descending: true)
        .snapshots()
        .map((query) {
      List<Pengantar> list = [];
      for (var doc in query.docs) {
        list.add(
          Pengantar.fromJson(
            doc,
          ),
        );
      }
      return list;
    });
  }
}
