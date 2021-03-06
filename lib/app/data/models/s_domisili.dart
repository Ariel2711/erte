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
const String swaktu = "waktu";
const String semail = "email";
const String snomer = "nomer";
const String sverifikasi = "verifikasi";

class Domisili {
  String? id;
  String? nama;
  String? kelamin;
  String? tempatlahir;
  DateTime? tanggallahir;
  int? nktp;
  String? alamat;
  String? keperluan1;
  DateTime? waktu;
  String? email;
  int? nomer;
  String? verifikasi;

  Domisili(
      {this.id,
      this.nama,
      this.kelamin,
      this.tempatlahir,
      this.tanggallahir,
      this.nktp,
      this.alamat,
      this.keperluan1,
      this.waktu,
      this.email,
      this.nomer,
      this.verifikasi});

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
      waktu: (json[swaktu] as Timestamp?)?.toDate(),
      email: json[semail],
      nomer: json[snomer],
      verifikasi: json[sverifikasi],
    );
  }

  Domisili.fromJson(DocumentSnapshot doc) {
    Map<String, dynamic>? json = doc.data() as Map<String, dynamic>?;
    id = doc.id;
      nama = json?[snama];
      kelamin = json?[skelamin];
      tempatlahir = json?[stempatlahir];
      tanggallahir = (json?[stanggallahir] as Timestamp?)?.toDate();
      nktp = json?[snktp];
      alamat = json?[salamat];
      keperluan1 = json?[skeperluan1];
      waktu = (json?[swaktu] as Timestamp?)?.toDate();
      email = json?[semail];
      nomer = json?[snomer];
      verifikasi = json?[sverifikasi];
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
        swaktu: waktu,
        semail: email,
        snomer: nomer,
        sverifikasi: verifikasi,
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

  Future<Domisili> streamList() async {
    print("getStream");
    return await db.collectionReference
        .orderBy("waktu", descending: true)
        .get()
        .then((event) {
      if (event.docs.length > 0) {
        return fromJson(event.docs.first);
      } else {
        return Domisili();
      }
    });
  }

  Stream<List<Domisili>> streamallList() async* {
    yield* db.collectionReference
        .orderBy("waktu", descending: true)
        .snapshots()
        .map((query) {
      List<Domisili> list = [];
      for (var doc in query.docs) {
        list.add(
          Domisili.fromJson(
            doc,
          ),
        );
      }
      return list;
    });
  }
}
