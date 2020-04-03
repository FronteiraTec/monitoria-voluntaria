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
    @required this.latitude,
    @required this.longitude,
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
      latitude: -23.201,
      longitude: -46.93716667,
    );
    // return null;
  }
}
