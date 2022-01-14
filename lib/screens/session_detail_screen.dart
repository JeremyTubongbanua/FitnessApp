import 'package:fitness_app/models/session.dart';
import 'package:fitness_app/providers/sessions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SessionDetailScreen extends StatelessWidget {
  static const String routeName = '/session-detail';

  const SessionDetailScreen();

  @override
  Widget build(BuildContext context) {
    final String? potentialId = ModalRoute.of(context)?.settings.arguments as String?;
    if (potentialId == null) {
      return const Scaffold(
        body: Center(
          child: Text('Something went wrong'),
        ),
      );
    }

    final Session session = Provider.of<Sessions>(context, listen: false).getSession(potentialId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${DateFormat('MMMM dd').format(session.day)} Session', style: Theme.of(context).textTheme.headline5),
      ),
    );
  }
}
