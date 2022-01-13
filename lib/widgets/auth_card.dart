import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/models/mode.dart';
import 'package:fitness_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AuthCard extends StatefulWidget {
  const AuthCard({Key? key}) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  Mode _mode = Mode.LOGIN;
  bool _isLoading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void _showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  void _clearFields() {
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
  }

  @override
  void initState() {
    super.initState();

    // debug
    _emailController.text = 'madivoso@gmail.com';
    _passwordController.text = 'lemon123';
    // _confirmPasswordController.text = 'lemon123';
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 10),
          TextField(
            decoration: const InputDecoration(
              label: Text('Email'),
              suffixIcon: Icon(Icons.email),
            ),
            controller: _emailController,
          ),
          TextField(
            decoration: const InputDecoration(
              label: Text('Password'),
              suffixIcon: Icon(Icons.vpn_key),
            ),
            controller: _passwordController,
            obscureText: true,
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.fastLinearToSlowEaseIn,
            height: _mode == Mode.LOGIN ? 0 : null,
            constraints: BoxConstraints(maxHeight: _mode == Mode.LOGIN ? 0 : 50),
            child: TextField(
              decoration: InputDecoration(
                label: const Text('Confirm Password'),
                suffixIcon: _mode == Mode.LOGIN ? null : const Icon(Icons.vpn_key),
              ),
              controller: _confirmPasswordController,
              obscureText: true,
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () async {
              if (_mode == Mode.SIGN_UP) {
                try {
                  setState(() {
                    _isLoading = true;
                  });
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
                  _showSnackBar(context, 'Successfully signed up.');
                  _confirmPasswordController.clear();
                } catch (err) {
                  final snackBarStr = err.toString();
                  _showSnackBar(context, snackBarStr);
                }
                setState(() {
                  _mode = Mode.LOGIN;
                });
              } else if (_mode == Mode.LOGIN) {
                try {
                  setState(() {
                    _isLoading = true;
                  });
                  await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
                  await Navigator.of(context).pushReplacementNamed(HomeScreen.routeName, arguments: null);
                } catch (err) {
                  final snackBarStr = err.toString();
                  _showSnackBar(context, snackBarStr);
                }
                _clearFields();
                setState(() {
                  _isLoading = false;
                });
              }
            },
            child: Text(
              _mode == Mode.SIGN_UP ? 'Sign Up' : 'Login',
              style: const TextStyle(fontSize: 18),
            ),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(10),
              minimumSize: const Size(double.infinity, 50),
            ),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {
              setState(() {
                if (_mode == Mode.SIGN_UP) {
                  _mode = Mode.LOGIN;
                } else {
                  _mode = Mode.SIGN_UP;
                }
              });
            },
            child: _isLoading
                ? CircularProgressIndicator()
                : Text(
                    _mode == Mode.SIGN_UP ? 'I have an account' : 'Create an account',
                    style: const TextStyle(fontSize: 16),
                  ),
          ),
        ],
      ),
    );
  }
}
