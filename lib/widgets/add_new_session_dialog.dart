import 'package:fitness_app/models/session.dart';
import 'package:fitness_app/providers/sessions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddNewSessionDialog extends StatefulWidget {
  final DateTime pickedDate;
  final TimeOfDay start;
  final TimeOfDay end;
  const AddNewSessionDialog(this.pickedDate, this.start, this.end);

  @override
  State<AddNewSessionDialog> createState() => _AddNewSessionDialogState();
}

class _AddNewSessionDialogState extends State<AddNewSessionDialog> {
  late DateTime _pickedDate;
  late TimeOfDay _start;
  late TimeOfDay _end;

  @override
  void initState() {
    super.initState();
    _pickedDate = widget.pickedDate;
    _start = widget.start;
    _end = widget.end;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Add New Session',
        style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 24, color: Colors.black),
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Provider.of<Sessions>(context, listen: false).addSession(Session(_pickedDate, _start, _end));
            Navigator.of(context).pop();
            Provider.of<Sessions>(context, listen: false).organizeList();
          },
          child: Text('Done', style: TextStyle(color: Colors.black)),
        ),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // const Text('Picked Date: ', style: TextStyle(fontSize: 18)),
              Text('${DateFormat('MMMM dd').format(_pickedDate)}', style: const TextStyle(fontSize: 18)),
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
                          _pickedDate = val!;
                        },
                      );
                    },
                  );
                },
                child: const Text(
                  'Choose Date',
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
          const Divider(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(_start.format(context)),
              Text(_end.format(context)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  showTimePicker(context: context, initialTime: widget.start).then((value) => setState(() {
                        _start = value!;
                        _end = TimeOfDay(hour: _start.hour + 1, minute: _start.minute);
                      }));
                },
                child: const Text(
                  'Start Time',
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              TextButton(
                onPressed: () {
                  showTimePicker(context: context, initialTime: widget.end).then((value) => setState(() => _end = value!));
                },
                child: const Text(
                  'End Time',
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ],
      ),
    );
    ;
  }
}
