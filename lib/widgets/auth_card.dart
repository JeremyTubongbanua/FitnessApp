import 'package:flutter/material.dart';

class AuthCard extends StatefulWidget {
  const AuthCard({Key? key}) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width * 0.8;
    final double height = size.height * 0.6;
    return Container(
      width: width,
      height: height,
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(label: Text('Email')),
            ),
            TextField(
              decoration: InputDecoration(label: Text('Password')),
            ),
            TextField(
              decoration: InputDecoration(label: Text('Confirm Password')),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Sign Up',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(10),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {},
              child: Text(
                'Login',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
