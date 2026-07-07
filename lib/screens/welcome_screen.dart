import 'package:flutter/material.dart';
import 'package:club_engine/screens/club_selector_screen.dart';
import 'package:club_engine/services/club_service.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final club = ClubService.currentClub;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: club.primaryColor,
        actions: [
          IconButton(
            tooltip: "Kulüp Değiştir",
            icon: const Icon(Icons.swap_horiz),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const ClubSelectorScreen()),
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const Spacer(),

              Image.asset(club.logoPath, width: 130, height: 130),

              const SizedBox(height: 25),

              Text(
                club.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: club.primaryColor,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                club.slogan,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, color: Colors.grey),
              ),

              const SizedBox(height: 45),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Anmelden", style: TextStyle(fontSize: 18)),
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text(
                    "Als Gast fortfahren",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),

              const Spacer(),

              SizedBox(
                height: 60,
                child: Center(
                  child: Text(
                    "Powered by Club Platform",
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
