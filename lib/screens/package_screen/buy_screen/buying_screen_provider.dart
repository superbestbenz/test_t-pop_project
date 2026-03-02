import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart'
    show ChangeNotifier, BuildContext, TextEditingController;
import 'package:flutter_easyloading/flutter_easyloading.dart' show EasyLoading;
import 'package:t_pop_testing/core/enum/payment_enum.dart' show PaymentMethod;
import 'package:t_pop_testing/data/repository/package_repository.dart'
    show PackageRepository;
import 'package:t_pop_testing/model/package_detail_model/package_detail_model.dart'
    show PackageDetailModel;



class BuyingScreenProvider extends ChangeNotifier {
  BuyingScreenProvider(this._packageRepository);
  final PackageRepository _packageRepository;

  TextEditingController methodController = TextEditingController();

  final List<PaymentMethod> paymentMethods = [
    PaymentMethod.creditCard,
    PaymentMethod.bankTransfer,
    PaymentMethod.mobileWallet,
  ];
  PaymentMethod? selectedMethod = PaymentMethod.creditCard;

  void purchasePackage(
    BuildContext context,
    PackageDetailModel? packageDetail,
  ) async {
    EasyLoading.show();
    try {
      await _packageRepository.purchasePackage(packageDetail, selectedMethod);
    } catch (e) {
      EasyLoading.showError('Purchase failed: $e');
      FirebaseCrashlytics.instance.recordError(
        e,
        null,
        reason: 'Purchase failed',
      );
    } finally {
      EasyLoading.dismiss();
    }
  }

 void selectMethod(PaymentMethod? method) {
    selectedMethod = method;
    methodController.text = '';
    notifyListeners();
  }

  @override
  void dispose() {
    methodController.dispose();
    super.dispose();
  }
}
