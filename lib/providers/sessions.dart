import 'package:fitness_app/models/session.dart';
import 'package:flutter/material.dart';

class Sessions with ChangeNotifier {
  // ignore: prefer_final_fields
  List<Session> _sessions = [
    Session(DateTime(2022, 1, 1), const TimeOfDay(hour: 16, minute: 20), const TimeOfDay(hour: 17, minute: 20)),
    Session(DateTime(2022, 1, 2), const TimeOfDay(hour: 16, minute: 20), const TimeOfDay(hour: 17, minute: 20)),
    Session(DateTime(2022, 1, 8), const TimeOfDay(hour: 12, minute: 0), const TimeOfDay(hour: 13, minute: 0)),
    Session(DateTime(2022, 1, 9), const TimeOfDay(hour: 14, minute: 20), const TimeOfDay(hour: 15, minute: 20)),
    Session(DateTime(2022, 1, 10), const TimeOfDay(hour: 16, minute: 0), const TimeOfDay(hour: 17, minute: 0)),
  ];

  void addSession(Session session) {
    _sessions.add(session);
    notifyListeners();
  }

  void removeSession(String id) {
    _sessions.removeWhere((sess) => sess.id == id);
    notifyListeners();
  }

  List<Session> get sessions {
    return [..._sessions];
  }

  Session getSession(String id) {
    return _sessions.firstWhere((element) => id == element.id);
  }

  void organizeList() {
    _sessions.sort((a, b) => a.day.difference(b.day).inHours);
    notifyListeners();
  }
}
