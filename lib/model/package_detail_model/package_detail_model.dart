import 'package:json_annotation/json_annotation.dart';

part 'package_detail_model.g.dart';

@JsonSerializable()
class PackageDetailModel {
  final String? id;
  final String? name;
  final int? price;
  final String? description;
  final String? imageUrl;

  const PackageDetailModel({
    this.id,
    this.name,
    this.price,
    this.description,
    this.imageUrl,
  });

  factory PackageDetailModel.fromJson(Map<String, dynamic> json) {
    return _$PackageDetailModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PackageDetailModelToJson(this);

  PackageDetailModel copyWith({
    String? id,
    String? name,
    int? price,
    String? description,
    String? imageUrl,
  }) {
    return PackageDetailModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
