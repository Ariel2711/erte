import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erte/app/data/database.dart';
import 'package:get/get.dart';

const String sid = "id";
const String snama = "nama";
const String skelamin = "kelamin";
const String stempatlahir = "tempatlahir";
const String stanggallahir = "tanggallahir";
const String snktp = "nktp";
const String salamat = "alamat";
const String skeperluan1 = "keperluan1";
const String skeperluan2 = "keperluan2";
const String swaktu = "waktu";

class Domisili {
  String? id;
  String? nama;
  String? kelamin;
  String? tempatlahir;
  DateTime? tanggallahir;
  int? nktp;
  String? alamat;
  String? keperluan1;
  String? keperluan2;
  DateTime? waktu;

  Domisili(
      {this.id,
      this.nama,
      this.kelamin,
      this.tempatlahir,
      this.tanggallahir,
      this.nktp,
      this.alamat,
      this.keperluan1,
      this.keperluan2,
      this.waktu});

  Domisili fromJson(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data() as Map<String, dynamic>;
    return Domisili(
      id: doc.id,
      nama: json[snama],
      kelamin: json[skelamin],
      tempatlahir: json[stempatlahir],
      tanggallahir: (json[stanggallahir] as Timestamp?)?.toDate(),
      nktp: json[snktp],
      alamat: json[salamat],
      keperluan1: json[skeperluan1],
      keperluan2: json[skeperluan2],
      waktu: (json[swaktu] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> get toJson => {
        sid: id,
        snama: nama,
        skelamin: kelamin,
        stempatlahir: tempatlahir,
        stanggallahir: tanggallahir,
        snktp : nktp,
        salamat: alamat,
        skeperluan1: keperluan1,
        skeperluan2: keperluan2,
        swaktu: waktu,
      };

  Database db = Database(
      collectionReference: firestore.collection(
        domisiliCollection,
      ),
      storageReference: storage.ref(domisiliCollection));

  Future<Domisili> save() async {
    id == null ? id = await db.add(toJson) : await db.edit(toJson);
    if (id != null) {
      db.edit(toJson);
    }
    return this;
  }
}
