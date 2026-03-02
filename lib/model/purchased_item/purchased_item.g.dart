// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchased_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchasedItem _$PurchasedItemFromJson(Map<String, dynamic> json) =>
    PurchasedItem(
      id: json['id'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      payment: $enumDecodeNullable(_$PaymentMethodEnumMap, json['payment']),
      itemId: json['itemId'] as String?,
    );

Map<String, dynamic> _$PurchasedItemToJson(PurchasedItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'payment': _$PaymentMethodEnumMap[instance.payment],
      'itemId': instance.itemId,
    };

const _$PaymentMethodEnumMap = {
  PaymentMethod.creditCard: 'creditCard',
  PaymentMethod.bankTransfer: 'bankTransfer',
  PaymentMethod.mobileWallet: 'mobileWallet',
};
