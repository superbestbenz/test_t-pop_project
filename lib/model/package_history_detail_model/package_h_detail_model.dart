import 'package:json_annotation/json_annotation.dart';
import 'package:t_pop_testing/model/package_detail_model/package_detail_model.dart' show PackageDetailModel;
import 'package:t_pop_testing/model/purchased_item/purchased_item.dart' show PurchasedItem;

part 'package_h_detail_model.g.dart';

@JsonSerializable()
class PackageHDetailModel {
  final PackageDetailModel? packageDetailModel;
  final PurchasedItem? purchasedItem;
  

  const PackageHDetailModel({
    this.packageDetailModel,
    this.purchasedItem,

  });

  factory PackageHDetailModel.fromJson(Map<String, dynamic> json) {
    return _$PackageHDetailModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PackageHDetailModelToJson(this);

  PackageHDetailModel copyWith({
    PackageDetailModel? packageDetailModel,
    PurchasedItem? purchasedItem,
  }) {
    return PackageHDetailModel(
      packageDetailModel: packageDetailModel ?? this.packageDetailModel,
      purchasedItem: purchasedItem ?? this.purchasedItem,
    );
  }
}
  