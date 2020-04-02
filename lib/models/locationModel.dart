import 'package:flutter/foundation.dart';

class Location {
  final double latitude;
  final double longitude;
  final String street;
  final String complement;
  final int number;
  final int id;
  final String nickname;
  final String reference;

  Location({
    this.latitude,
    this.longitude,
    @required this.street,
    @required this.complement,
    @required this.number,
    @required this.id,
    @required this.nickname,
    @required this.reference,
  });

  static Location parseFromMap(Map<String, dynamic> map) {
    return Location(
      street: map["address_street"],
      complement: map["address_complement"],
      number: map["address_number"],
      id: map["address_id"],
      nickname: map["address_nickname"],
      reference: map["address_reference"],
    );
    // return null;
  }
}
