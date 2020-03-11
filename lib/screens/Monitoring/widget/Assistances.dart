import 'package:flutter/cupertino.dart';

class Assistances{
  int _id;
  int _idd;
  String _nome;
  String _locale;
  String _dateTime;
  String _description;
  int _numberParticipants;
  int _active;

  Assistances(int id, int idd, String locale,String dateTime){
    this._id = id;
    this._idd = idd;
    this._locale = locale;
    this._dateTime = dateTime;
  }

  int get id{
    return this._id;
  }

  String get nome{return this._nome;}
  String get locale{return this._locale;}
  String get dateTime{return this._dateTime;}
  String get description{return this._description;}


}