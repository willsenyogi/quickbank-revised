import 'package:flutter/material.dart';
import 'package:quickbank_revised/presentation/kartu_baru_screen/kartu_baru_screen.dart';
import 'package:quickbank_revised/presentation/kartu_biru_screen/kartu_biru_screen.dart';
import 'package:quickbank_revised/presentation/kartu_kuning_screen/kartu_kuning_screen.dart';
import 'package:quickbank_revised/presentation/page_pertama_screen/page_pertama_screen.dart';
import 'package:quickbank_revised/presentation/biodata_screen/biodata_screen.dart';
import 'package:quickbank_revised/presentation/verifikasi_screen/verifikasi_screen.dart';
import 'package:quickbank_revised/presentation/page_kedua_screen/page_kedua_screen.dart';
import 'package:quickbank_revised/presentation/page_ketiga_screen/page_ketiga_screen.dart';
import 'package:quickbank_revised/presentation/sign_in_done_screen/sign_in_done_screen.dart';
import 'package:quickbank_revised/presentation/homepage_done_page/homepage_done_page.dart';
import 'package:quickbank_revised/presentation/history_on_progress_screen/history_on_progress_screen.dart';
import 'package:quickbank_revised/presentation/page_qr_done_screen/page_qr_done_screen.dart';
import 'package:quickbank_revised/presentation/qb_transfer_screen/qb_transfer_screen.dart';
import 'package:quickbank_revised/presentation/konfirmasi_qb_screen/konfirmasi_qb_screen.dart';
import 'package:quickbank_revised/presentation/pilihan_transfer_screen/pilihan_transfer_screen.dart';
import 'package:quickbank_revised/presentation/transfer_bank_lain_screen/transfer_bank_lain_screen.dart';
import 'package:quickbank_revised/presentation/konfirmasi_bank_lain_screen/konfirmasi_bank_lain_screen.dart';
import 'package:quickbank_revised/presentation/transfer_va_screen/transfer_va_screen.dart';
import 'package:quickbank_revised/presentation/konfirmasi_va_screen/konfirmasi_va_screen.dart';
import 'package:quickbank_revised/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String pagePertamaScreen = '/page_pertama_screen';

  static const String biodataScreen = '/biodata_screen';

  static const String verifikasiScreen = '/verifikasi_screen';

  static const String pageKeduaScreen = '/page_kedua_screen';

  static const String pageKetigaScreen = '/page_ketiga_screen';

  static const String signInDoneScreen = '/sign_in_done_screen';

  static const String homepageDoneScreen = '/homepage_done_page';

  static const String homepageDoneContainerScreen =
      '/homepage_done_container_screen';

  static const String historyOnProgressScreen = '/history_on_progress_screen';

  static const String pageQrDoneScreen = '/page_qr_done_screen';

  static const String qbTransferScreen = '/qb_transfer_screen';

  static const String konfirmasiQbScreen = '/konfirmasi_qb_screen';

  static const String pilihanTransferScreen = '/pilihan_transfer_screen';

  static const String transferBankLainScreen = '/transfer_bank_lain_screen';

  static const String konfirmasiBankLainScreen = '/konfirmasi_bank_lain_screen';

  static const String transferVaScreen = '/transfer_va_screen';

  static const String konfirmasiVaScreen = '/konfirmasi_va_screen';

  static const String kartuBaruScreen = '/kartu_baru_screen';

  static const String kartuBiruScreen = '/kartu_biru_screen';

  static const String kartuKuningScreen = '/kartu_kuning_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    pagePertamaScreen: (context) => PagePertamaScreen(),
    biodataScreen: (context) => BiodataScreen(),
    verifikasiScreen: (context) => VerifikasiScreen(),
    pageKeduaScreen: (context) => PageKeduaScreen(),
    pageKetigaScreen: (context) => PageKetigaScreen(),
    signInDoneScreen: (context) => SignInDoneScreen(),
    homepageDoneScreen: (context) => HomepageDoneScreen(),
    historyOnProgressScreen: (context) => HistoryOnProgressScreen(),
    pageQrDoneScreen: (context) => PageQrDoneScreen(),
    qbTransferScreen: (context) => QbTransferScreen(),
    konfirmasiQbScreen: (context) => KonfirmasiQbScreen(),
    pilihanTransferScreen: (context) => PilihanTransferScreen(),
    transferBankLainScreen: (context) => TransferBankLainScreen(),
    konfirmasiBankLainScreen: (context) => KonfirmasiBankLainScreen(),
    transferVaScreen: (context) => TransferVaScreen(),
    konfirmasiVaScreen: (context) => KonfirmasiVaScreen(),
    kartuBaruScreen: (context) => KartuBaruScreen(),
    kartuBiruScreen: (context) => KartuBiruScreen(),
    kartuKuningScreen: (context) => KartuKuningScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
