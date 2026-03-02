// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get shoppingPackage => 'แพ็กเกจช้อปปิ้ง';

  @override
  String get buy => 'ซื้อ';

  @override
  String get paymentMethod => 'วิธีการชำระเงิน';

  @override
  String get creditCard => 'บัตรเครดิต';

  @override
  String get bankTransfer => 'โอนผ่านธนาคาร';

  @override
  String get mobileWallet => 'กระเป๋าเงินมือถือ';

  @override
  String get methodDetails => 'รายละเอียด';

  @override
  String get custom => 'กำหนดเอง';

  @override
  String get payNow => 'ชำระเงินตอนนี้(#1)';

  @override
  String get thb => 'บาท';
}
