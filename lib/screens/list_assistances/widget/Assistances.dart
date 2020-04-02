import 'package:flutter/foundation.dart';

class Assistances {
  final int idAssistance;
  final int idAssistant;
  final String title;
  final int numberParticipants;
  final int location;
  final String description;
  final DateTime date;
  
  Assistances({
    @required this.idAssistance,
    @required this.idAssistant,
    @required this.title,
    @required this.numberParticipants,
    @required this.location,
    @required this.description,
    @required this.date,
  });

  factory Assistances.fromJson(var dado){
  return Assistances(
          title: dado["assistance_title"],
          description: dado["assistance_description"],
          idAssistance: dado["assistance_id"],
          idAssistant: dado["assistance_owner_id"],
          location: dado["assistance_local_id"],
          numberParticipants: dado["assistance_num_participants"],
          date: DateTime.parse(dado["assistance_date"])
          );
  }

  int get assistanceId {
    return idAssistance;
  }

  int get assistantId => idAssistant;
  String get name => title;
  int get participants => numberParticipants;
  int get locate => location;
  String get descript => description;
  DateTime get dateAssistance => date;
}
