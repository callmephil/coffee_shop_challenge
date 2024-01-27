// reason: recommended by freezed documentation
// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String firstName,
    required String lastName,
    String? phoneNumber,
    String? avatar,
    required List<Address> address,
  }) = _User;
  const User._();

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

  String get fullName => '$firstName $lastName';
}

@freezed
class Address with _$Address {
  const factory Address({
    required String street,
    required String city,
    required String state,
    required String zipCode,
  }) = _Address;

  factory Address.fromJson(Map<String, Object?> json) =>
      _$AddressFromJson(json);
}
