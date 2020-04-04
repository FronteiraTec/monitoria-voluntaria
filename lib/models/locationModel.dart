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
  final String cep;


  Location({
    this.latitude,
    this.longitude,
    this.street,
    this.complement,
    this.number,
    this.id,
    this.nickname,
    this.reference,
    this.cep,
  });

  static Location parseFromMap(Map<String, dynamic> map) {
    return Location(
      id: map["id"],
      street: map["street"],
      complement: map["complement"],
      number: map["number"],
      nickname: map["nickname"],
      reference: map["reference"],
      // latitude: map["latitude"],
      // longitude: map["logintude"],
      longitude: 5555,
      latitude: 8888,
      cep: map["cep"]
    );
  }
}
