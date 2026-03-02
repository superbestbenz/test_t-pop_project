// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_h_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PackageHDetailModel _$PackageHDetailModelFromJson(Map<String, dynamic> json) =>
    PackageHDetailModel(
      packageDetailModel: json['packageDetailModel'] == null
          ? null
          : PackageDetailModel.fromJson(
              json['packageDetailModel'] as Map<String, dynamic>,
            ),
      purchasedItem: json['purchasedItem'] == null
          ? null
          : PurchasedItem.fromJson(
              json['purchasedItem'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$PackageHDetailModelToJson(
  PackageHDetailModel instance,
) => <String, dynamic>{
  'packageDetailModel': instance.packageDetailModel,
  'purchasedItem': instance.purchasedItem,
};
