import "../models/userModel.dart";
import '../models/locationModel.dart';

class Assistance {
  final int id;
  final User owner;
  final String title;
  final int numberParticipants;
  final Location location;
  final String description;
  final String createdAt;
  final DateTime date;

  Assistance({
    this.id,
    this.owner,
    this.title,
    this.numberParticipants,
    this.location,
    this.description,
    this.date,
    this.createdAt,
  });
}