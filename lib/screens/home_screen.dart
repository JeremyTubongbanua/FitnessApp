import 'package:fitness_app/models/session.dart';
import 'package:fitness_app/providers/sessions.dart';
import 'package:fitness_app/widgets/add_new_session.dart';
import 'package:fitness_app/widgets/sessions_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Theme.of(context).colorScheme.background,
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 24.0,
              bottom: 8,
              left: 16,
            ),
            child: Text(
              'FitnessApp',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                            left: 16,
                          ),
                          child: Text(
                            'Sessions',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: IconButton(
                          iconSize: 24,
                          icon: const Icon(
                            Icons.add,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AddNewSession();
                              },
                            );
                          },
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
                  child: Container(
                    padding: const EdgeInsets.only(left: 8),
                    color: Colors.white,
                    child: const SessionsList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
