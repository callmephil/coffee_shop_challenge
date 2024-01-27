// recommended by freezed documentation
// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

enum ProductSize {
  small(0),
  medium(15),
  large(20);

  const ProductSize(this.priceModifier);

  final double priceModifier;
}

enum ProductType {
  hot,
  cold,
}

// TODO: nice to have product options
// enum ProductOptionValue {
//   milk,
//   sugar,
//   chocolate,
//   vanilla,
//   caramel,
//   whippedCream,
// }

@freezed
class Product with _$Product {
  const factory Product({
    required String id,
    required String name,
    String? description,
    required String thumbnail,
    required String image,
    required double price,
  }) = _Product;
  const Product._();

  factory Product.fromJson(Map<String, Object?> json) =>
      _$ProductFromJson(json);
}


// @freezed
// class ProductOption with _$ProductOption {
//   const factory ProductOption({
//     required String id,
//     required String name,
//     required List<ProductOptionValue> values,
//   }) = _ProductOption;
//   const ProductOption._();

//   factory ProductOption.fromJson(Map<String, Object?> json) =>
//       _$ProductOptionFromJson(json);
// }
