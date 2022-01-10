import 'package:fitness_app/widgets/auth_card.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  static const String routeName = '/';

  const AuthScreen();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.all(55),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'FitnessApp',
                    style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.black),
                  ),
                  Text(
                    'You already know what\'s up',
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            AuthCard(),
          ],
        ),
      ),
    );
  }
}
