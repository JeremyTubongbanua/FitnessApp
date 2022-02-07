import 'package:fitness_app/models/session.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SessionItem extends StatelessWidget {
  final Session sess;

  const SessionItem(this.sess);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat('MMMM dd yyyy').format(sess.day),
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
    );
  }
}
