import 'package:flutter/material.dart';
import 'package:club_engine/screens/club_selector_screen.dart';

void main() {
  runApp(const ClubOS());
}

class ClubOS extends StatelessWidget {
  const ClubOS({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Club Platform',
      home: const ClubSelectorScreen(),
    );
  }
}
