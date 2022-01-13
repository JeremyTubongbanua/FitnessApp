import 'package:fitness_app/models/session.dart';
import 'package:flutter/material.dart';

class Sessions with ChangeNotifier {
  // ignore: prefer_final_fields
  List<Session> _sessions = [
    Session(DateTime(2021, 1, 2), TimeOfDay(hour: 16, minute: 20), TimeOfDay(hour: 17, minute: 20)),
    Session(DateTime(2021, 1, 8), TimeOfDay(hour: 12, minute: 0), TimeOfDay(hour: 13, minute: 0)),
    Session(DateTime(2021, 1, 9), TimeOfDay(hour: 14, minute: 20), TimeOfDay(hour: 15, minute: 20)),
    Session(DateTime(2021, 1, 10), TimeOfDay(hour: 16, minute: 0), TimeOfDay(hour: 17, minute: 0)),
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
}
