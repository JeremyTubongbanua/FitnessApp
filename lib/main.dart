import 'package:fitness_app/screens/auth_screen.dart';
import 'package:flutter/material.dart';

class FitnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Colors.red,
          primaryVariant: Color.fromRGBO(72, 167, 255, 1),
          secondary: Colors.orange,
        ),
        textTheme: Theme.of(context).textTheme.copyWith(
              headline6: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w900,
                fontFamily: 'Cairo',
                fontSize: 48,
              ),
            ),
      ),
      routes: {
        AuthScreen.routeName: (_) => AuthScreen(),
      },
    );
  }
}

void main() {
  runApp(FitnessApp());
}
