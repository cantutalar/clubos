import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const ClubOS());
}

class ClubOS extends StatelessWidget {
  const ClubOS({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ClubOS',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const WelcomeScreen(),
    );
  }
}
