import 'package:fitness_app/models/session.dart';
import 'package:fitness_app/providers/sessions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SessionsList extends StatelessWidget {
  const SessionsList();

  @override
  Widget build(BuildContext context) {
    List<Session> sessions = Provider.of<Sessions>(context).sessions;
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
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('MMMM dd').format(sess.day),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      sess.start.format(context),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const Text(
                      ' - ',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      sess.end.format(context),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      itemCount: sessions.length,
    );
  }
}
