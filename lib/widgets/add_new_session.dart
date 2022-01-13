import 'package:fitness_app/models/session.dart';
import 'package:fitness_app/providers/sessions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddNewSession extends StatefulWidget {
  const AddNewSession({Key? key}) : super(key: key);

  @override
  _AddNewSessionState createState() => _AddNewSessionState();
}

class _AddNewSessionState extends State<AddNewSession> {
  DateTime? pickedDate;
  TimeOfDay? start;
  TimeOfDay? end;

  @override
  void initState() {
    pickedDate = DateTime.now();
    start = TimeOfDay(hour: pickedDate!.hour, minute: pickedDate!.minute);
    end = TimeOfDay(hour: start!.hour + 1, minute: start!.minute);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add a New Session', style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 24)),
      actions: [
        TextButton(
          onPressed: () {
            Provider.of<Sessions>(context, listen: false).addSession(Session(pickedDate!, start!, end!));
            Navigator.of(context).pop();
          },
          child: const Text('Add'),
        )
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // const Text('Picked Date: ', style: TextStyle(fontSize: 18)),
              Text(DateFormat('MMMM dd').format(pickedDate!), style: const TextStyle(fontSize: 18)),
              TextButton(
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.fromMicrosecondsSinceEpoch(100),
                    lastDate: DateTime.now(),
                  ).then(
                    (val) {
                      setState(
                        () {
                          pickedDate = val;
                        },
                      );
                    },
                  );
                },
                child: const Text(
                  'Choose Date',
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
          const Divider(height: 0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  showTimePicker(context: context, initialTime: start!).then((value) => setState(() => start = value));
                },
                child: const Text(
                  'Start Time',
                  textAlign: TextAlign.start,
                ),
              ),
              TextButton(
                onPressed: () {
                  showTimePicker(context: context, initialTime: end!).then((value) => setState(() => end = value));
                },
                child: const Text(
                  'End Time',
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(start!.format(context)),
              Text(end!.format(context)),
            ],
          ),
        ],
      ),
    );
  }
}
