import 'package:t_pop_testing/data/data_source/package_api.dart';
import 'package:t_pop_testing/model/package_detail_model/package_detail_model.dart'
    show PackageDetailModel;

class PackageRepository {
  PackageRepository(this._packageApi);
  final PackageApi _packageApi;

  Future<List<PackageDetailModel>> getAllPackageDetail() {
    return _packageApi.getPackageDetail();
  }
}
