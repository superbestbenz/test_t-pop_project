import 'package:t_pop_testing/core/enum/payment_enum.dart' show PaymentMethod;
import 'package:t_pop_testing/data/data_source/package_api.dart';
import 'package:t_pop_testing/model/package_detail_model/package_detail_model.dart'
    show PackageDetailModel;
import 'package:t_pop_testing/model/purchased_item/purchased_item.dart'
    show PurchasedItem;

class PackageRepository {
  PackageRepository(this._packageApi);
  final PackageApi _packageApi;

  Future<List<PackageDetailModel>> getAllPackageDetail() {
    return _packageApi.getPackageDetail();
  }

  Future<void> purchasePackage(
    PackageDetailModel? packageDetail,
    PaymentMethod? paymentMethod,
  ) async {
    if (packageDetail == null) return;
    await _packageApi.purchasePackage(
      packageDetail.id,
      packageDetail.duration,
      paymentMethod,
    );
  }

  Future<List<PurchasedItem>> getHistory() async {
    return await _packageApi.getHistory();
  }
}
