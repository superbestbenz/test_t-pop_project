import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart' show ChangeNotifier;
import 'package:t_pop_testing/core/widget/w_skeleton_loading.dart'
    show SkeletonState;
import 'package:t_pop_testing/data/repository/package_repository.dart'
    show PackageRepository;
import 'package:t_pop_testing/model/package_detail_model/package_detail_model.dart'
    show PackageDetailModel;
import 'package:t_pop_testing/model/purchased_item/purchased_item.dart'
    show PurchasedItem;

class PackageHistoryScreenProvider extends ChangeNotifier {
  PackageHistoryScreenProvider(this._packageRepository);
  final PackageRepository _packageRepository;
  List<PurchasedItem>? purchaseHistory;
  SkeletonState _isLoading = SkeletonState.success;
  List<PackageDetailModel>? _packageDetail;

  SkeletonState get isLoading => _isLoading;
  List<PackageDetailModel>? get packageDetail => _packageDetail;

  Future<void> init() async {
    _isLoading = SkeletonState.loading;
    notifyListeners();
    await getHistory();
    await getPackageDetail();
    _isLoading = SkeletonState.success;
    notifyListeners();
  }

  Future<void> getHistory() async {
    try {
      purchaseHistory = await _packageRepository.getHistory();
      purchaseHistory?.reversed.toList();
    } catch (e, stackTrace) {
      FirebaseCrashlytics.instance.recordError(
        e,
        stackTrace,
        reason: 'Failed to load purchase history',
      );
    }
  }

  Future<void> getPackageDetail() async {
    try {
      _packageDetail = await _packageRepository.getAllPackageDetail();
    } catch (e, stackTrace) {
      FirebaseCrashlytics.instance.recordError(
        e,
        stackTrace,
        reason: 'Failed to load package details',
      );
    }
  }

  PackageDetailModel? selectPackageDetail(String packageId) {
    return _packageDetail?.firstWhere((detail) => detail.id == packageId);
  }
}
