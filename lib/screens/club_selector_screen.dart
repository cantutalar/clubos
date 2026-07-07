import 'package:flutter/material.dart';
import 'package:club_engine/data/clubs.dart';
import 'package:club_engine/services/club_service.dart';
import 'package:club_engine/screens/welcome_screen.dart';

class ClubSelectorScreen extends StatelessWidget {
  const ClubSelectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kulüp Seç"), centerTitle: true),
      body: ListView.builder(
        itemCount: allClubs.length,
        itemBuilder: (context, index) {
          final club = allClubs[index];

          return ListTile(
            leading: Image.asset(club.logoPath, width: 45, height: 45),
            title: Text(
              club.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(club.slogan),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              ClubService.changeClub(club);

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const WelcomeScreen()),
              );
            },
          );
        },
      ),
    );
  }
}
