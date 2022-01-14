import 'package:fitness_app/providers/sessions.dart';
import 'package:fitness_app/widgets/add_new_session_dialog.dart';
import 'package:fitness_app/widgets/sessions_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SessionsTab extends StatefulWidget {
  static const String routeName = '/home';

  const SessionsTab();

  @override
  State<SessionsTab> createState() => _SessionsTabState();
}

class _SessionsTabState extends State<SessionsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (context) {
              final DateTime now = DateTime.now();
              DateTime pickedDate = DateTime(now.year, now.month, now.day);
              TimeOfDay start = TimeOfDay(hour: now.hour, minute: now.minute);
              TimeOfDay end = TimeOfDay(hour: start.hour + 1, minute: start.minute);
              return AddNewSessionDialog(pickedDate, start, end);
            },
          );
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(color: Theme.of(context).colorScheme.background),
                  padding: const EdgeInsets.only(top: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Sessions',
                          style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.black, fontSize: 36),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1.5,
                  color: Colors.black.withOpacity(0.3),
                  height: 0,
                ),
                Expanded(
                  child: const SessionsList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
