import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/firebase_options.dart';
import 'package:fitness_app/providers/sessions.dart';
import 'package:fitness_app/screens/auth_screen.dart';
import 'package:fitness_app/screens/first_screen.dart';
import 'package:fitness_app/screens/tabs/sessions_tab.dart';
import 'package:fitness_app/screens/session_detail_screen.dart';
import 'package:fitness_app/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FitnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MaterialApp fitnessApp = MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Colors.black,
          primaryVariant: Color.fromRGBO(72, 167, 255, 1),
          secondary: Colors.orange,
          background: Colors.white,
        ),
        textTheme: Theme.of(context).textTheme.copyWith(
              headline6: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontFamily: 'Cairo',
                fontSize: 48,
              ),
              headline5: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontFamily: 'Cairo',
                fontSize: 24,
              ),
            ),
      ),
      routes: {
        '/': (_) => const FirstScreen(),
        TabsScreen.routeName: (_) => const TabsScreen(), // '/home'
        SessionDetailScreen.routeName: (_) => const SessionDetailScreen(), // '/session-detail'
        AuthScreen.routeName: (_) => const AuthScreen(), // '/auth'
      },
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Sessions()),
      ],
      child: fitnessApp,
    );
  }
}

Future<FirebaseApp> _initializeFirebase() async {
  return Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

void main() async {
  await _initializeFirebase();
  runApp(FitnessApp());
}
