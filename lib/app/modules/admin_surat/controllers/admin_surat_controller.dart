import 'package:erte/app/data/models/form_kk.dart';
import 'package:erte/app/data/models/form_ktp.dart';
import 'package:erte/app/data/models/s_domisili.dart';
import 'package:erte/app/data/models/s_pengantar.dart';
import 'package:get/get.dart';

class AdminSuratController extends GetxController {
  RxList<Pengantar> rxPengantars = RxList<Pengantar>();
  List<Pengantar> get pengantars => rxPengantars.value;
  set pengantars(List<Pengantar> value) => rxPengantars.value = value;

  RxList<Domisili> rxDomisilis = RxList<Domisili>();
  List<Domisili> get domisilis => rxDomisilis.value;
  set domisilis(List<Domisili> value) => rxDomisilis.value = value;

  RxList<KTP> rxKTPs = RxList<KTP>();
  List<KTP> get ktps => rxKTPs.value;
  set ktps(List<KTP> value) => rxKTPs.value = value;

  RxList<KK> rxKKs = RxList<KK>();
  List<KK> get kks => rxKKs.value;
  set kks(List<KK> value) => rxKKs.value = value;

  @override
  void onInit() {
    rxPengantars.bindStream(Pengantar().streamallList());
    rxDomisilis.bindStream(Domisili().streamallList());
    rxKKs.bindStream(KK().streamallList());
    rxKTPs.bindStream(KTP().streamallList());
    super.onInit();
  }
}
