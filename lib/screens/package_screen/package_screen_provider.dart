import 'package:flutter/material.dart' show ChangeNotifier;
import 'package:t_pop_testing/core/widget/w_skeleton_loading.dart'
    show SkeletonState;
import 'package:t_pop_testing/data/repository/package_repository.dart';
import 'package:t_pop_testing/model/package_detail_model/package_detail_model.dart'
    show PackageDetailModel;

class PackageScreenProvider extends ChangeNotifier {
  PackageScreenProvider(this._packageRepository);
  final PackageRepository _packageRepository;
  SkeletonState _isLoading = SkeletonState.success;

  SkeletonState get isLoading => _isLoading;
  List<PackageDetailModel>? _packageDetail;

  List<PackageDetailModel>? get packageDetail => _packageDetail;

  void init() async {
    _isLoading = SkeletonState.loading;
    notifyListeners();
    await getPackageDetail();
    _isLoading = SkeletonState.success;
    notifyListeners();
  }

  Future<void> getPackageDetail() async {
    _packageDetail = await _packageRepository.getAllPackageDetail();
  }

}
