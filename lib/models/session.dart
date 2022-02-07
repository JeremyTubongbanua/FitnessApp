import 'package:flutter/material.dart';

class Session {
  final DateTime _day;
  final TimeOfDay _start;
  final TimeOfDay _end;
  late String id;

  Session(this._day, this._start, this._end) {
    id = _day.toIso8601String();
  }

  DateTime get day {
    return _day;
  }

  TimeOfDay get start {
    return _start;
  }

  TimeOfDay get end {
    return _end;
  }
}
