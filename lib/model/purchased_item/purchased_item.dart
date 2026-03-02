import 'package:json_annotation/json_annotation.dart';
import 'package:t_pop_testing/core/enum/payment_enum.dart' show PaymentMethod;

part 'purchased_item.g.dart';

@JsonSerializable()
class PurchasedItem {
  String? id;
  DateTime? startDate;
  DateTime? endDate;
  PaymentMethod? payment;
  String? itemId;

  PurchasedItem({
    this.id,
    this.startDate,
    this.endDate,
    this.payment,
    this.itemId,
  });

  factory PurchasedItem.fromJson(Map<String, dynamic> json) {
    return _$PurchasedItemFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PurchasedItemToJson(this);

  PurchasedItem copyWith({
    String? id,
    DateTime? startDate,
    DateTime? endDate,
    PaymentMethod? payment,
    String? itemId,
  }) {
    return PurchasedItem(
      id: id ?? this.id,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      payment: payment ?? this.payment,
      itemId: itemId ?? this.itemId,
    );
  }
}
