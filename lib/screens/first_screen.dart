import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/screens/auth_screen.dart';
import 'package:fitness_app/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      // print(FirebaseAuth.instance.currentUser);
      if (FirebaseAuth.instance.currentUser == null) {
        Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
      } else {
        Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
      }
    });
    return Scaffold(
      body: Center(
        child: Text('Loading...'),
      ),
    );
  }
}
