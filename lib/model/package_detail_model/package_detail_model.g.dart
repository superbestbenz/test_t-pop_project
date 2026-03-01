// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PackageDetailModel _$PackageDetailModelFromJson(Map<String, dynamic> json) =>
    PackageDetailModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toInt(),
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$PackageDetailModelToJson(PackageDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
    };
