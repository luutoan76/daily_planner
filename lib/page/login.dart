import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // This will ensure the image covers the entire screen
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/loginback.png'), // Replace with your image URL or AssetImage for local images
            fit: BoxFit.cover, // Ensures the image covers the whole screen
          ),
        ),
        child: const Center(
          child: Text(
            "Your Content",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}