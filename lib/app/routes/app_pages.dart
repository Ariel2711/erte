import 'package:get/get.dart';

import '../modules/admin/bindings/admin_binding.dart';
import '../modules/admin/views/admin_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/form_kk/bindings/form_kk_binding.dart';
import '../modules/form_kk/views/form_kk_view.dart';
import '../modules/form_ktp/bindings/form_ktp_binding.dart';
import '../modules/form_ktp/views/form_ktp_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/intro/bindings/intro_binding.dart';
import '../modules/intro/views/intro_view.dart';
import '../modules/lapor/bindings/lapor_binding.dart';
import '../modules/lapor/views/lapor_view.dart';
import '../modules/profil/bindings/profil_binding.dart';
import '../modules/profil/views/profil_view.dart';
import '../modules/reset/bindings/reset_binding.dart';
import '../modules/reset/views/reset_view.dart';
import '../modules/riwayat/bindings/riwayat_binding.dart';
import '../modules/riwayat/views/riwayat_view.dart';
import '../modules/s_acara/bindings/s_acara_binding.dart';
import '../modules/s_acara/views/s_acara_view.dart';
import '../modules/s_domisili/bindings/s_domisili_binding.dart';
import '../modules/s_domisili/views/s_domisili_view.dart';
import '../modules/s_kelahiran/bindings/s_kelahiran_binding.dart';
import '../modules/s_kelahiran/views/s_kelahiran_view.dart';
import '../modules/s_kematian/bindings/s_kematian_binding.dart';
import '../modules/s_kematian/views/s_kematian_view.dart';
import '../modules/s_kontrak/bindings/s_kontrak_binding.dart';
import '../modules/s_kontrak/views/s_kontrak_view.dart';
import '../modules/s_pengantar/bindings/s_pengantar_binding.dart';
import '../modules/s_pengantar/views/s_pengantar_view.dart';
import '../modules/s_pernyataan/bindings/s_pernyataan_binding.dart';
import '../modules/s_pernyataan/views/s_pernyataan_view.dart';
import '../modules/s_usaha/bindings/s_usaha_binding.dart';
import '../modules/s_usaha/views/s_usaha_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.S_PENGANTAR,
      page: () => SPengantarView(),
      binding: SPengantarBinding(),
    ),
    GetPage(
      name: _Paths.FORM_KTP,
      page: () => FormKtpView(),
      binding: FormKtpBinding(),
    ),
    GetPage(
      name: _Paths.S_PERNYATAAN,
      page: () => SPernyataanView(),
      binding: SPernyataanBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.RESET,
      page: () => ResetView(),
      binding: ResetBinding(),
    ),
    GetPage(
      name: _Paths.PROFIL,
      page: () => ProfilView(),
      binding: ProfilBinding(),
    ),
    GetPage(
      name: _Paths.INTRO,
      page: () => IntroView(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: _Paths.S_KEMATIAN,
      page: () => SKematianView(),
      binding: SKematianBinding(),
    ),
    GetPage(
      name: _Paths.S_KELAHIRAN,
      page: () => SKelahiranView(),
      binding: SKelahiranBinding(),
    ),
    GetPage(
      name: _Paths.S_DOMISILI,
      page: () => SDomisiliView(),
      binding: SDomisiliBinding(),
    ),
    GetPage(
      name: _Paths.S_KONTRAK,
      page: () => SKontrakView(),
      binding: SKontrakBinding(),
    ),
    GetPage(
      name: _Paths.S_USAHA,
      page: () => SUsahaView(),
      binding: SUsahaBinding(),
    ),
    GetPage(
      name: _Paths.S_ACARA,
      page: () => SAcaraView(),
      binding: SAcaraBinding(),
    ),
    GetPage(
      name: _Paths.LAPOR,
      page: () => LaporView(),
      binding: LaporBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN,
      page: () => AdminView(),
      binding: AdminBinding(),
    ),
    GetPage(
      name: _Paths.RIWAYAT,
      page: () => RiwayatView(),
      binding: RiwayatBinding(),
    ),
    GetPage(
      name: _Paths.FORM_KK,
      page: () => FormKkView(),
      binding: FormKkBinding(),
    ),
  ];
}
