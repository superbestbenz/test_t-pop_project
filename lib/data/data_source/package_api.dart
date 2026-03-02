import 'package:t_pop_testing/core/enum/payment_enum.dart' show PaymentMethod;
import 'package:t_pop_testing/core/state/app_state.dart';
import 'package:t_pop_testing/model/package_detail_model/package_detail_model.dart';
import 'package:t_pop_testing/model/purchased_item/purchased_item.dart';

// Simple API implementation - no need to subclass unless mocking in tests.
class PackageApi {
  PackageApi({required AppState appState}) : _appState = appState;
  final AppState _appState;
  Future<List<PackageDetailModel>> getPackageDetail() {
    return Future.delayed(
      const Duration(seconds: 2),
      () => _appState.packageDetails,
    );
  }

  Future<void> purchasePackage(
    String? itemId,
    Duration? duration,
    PaymentMethod? paymentMethod,
  ) async {
    if (itemId == null || duration == null) return;
    await Future.delayed(const Duration(seconds: 2));

    _appState.addItem(
      PurchasedItem(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        startDate: DateTime.now(),
        endDate: DateTime.now().add(duration),
        payment: paymentMethod,
        itemId: itemId,
      ),
    );
  }

  Future<List<PurchasedItem>> getHistory() {
    return Future.delayed(
      const Duration(seconds: 2),
      () => _appState.purchasedItems,
    );
  }
}
