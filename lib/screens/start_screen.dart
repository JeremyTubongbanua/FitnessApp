import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/screens/auth_screen.dart';
import 'package:fitness_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  static const String routeName = '/';

  const StartScreen();

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  void _navigatePage(BuildContext ctx) async {
    final User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      // Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    } else {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _navigatePage(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
