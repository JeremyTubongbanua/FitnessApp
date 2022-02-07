import 'package:fitness_app/models/session.dart';
import 'package:fitness_app/providers/sessions.dart';
import 'package:fitness_app/screens/session_detail_screen.dart';
import 'package:fitness_app/widgets/session_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SessionsList extends StatelessWidget {
  const SessionsList();

  @override
  Widget build(BuildContext context) {
    List<Session> sessions = Provider.of<Sessions>(context).sessions.reversed.toList();
    if (sessions.isEmpty) return Center(child: Text('No Sessions Yet'));
    return ListView.builder(
      itemBuilder: (context, index) {
        final Session sess = sessions[index];
        return Dismissible(
          key: ValueKey(sess.id),
          onDismissed: (direction) {
            final sessContainer = Provider.of<Sessions>(context, listen: false);
            sessContainer.removeSession(sess.id);
          },
          direction: DismissDirection.endToStart,
          background: Container(
            color: Colors.red,
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 24),
          ),
          child: GestureDetector(
            onTap: () async {
              await Navigator.of(context).pushNamed(SessionDetailScreen.routeName, arguments: sess.id);
            },
            child: SessionItem(sess),
          ),
        );
      },
      itemCount: sessions.length,
    );
  }
}
