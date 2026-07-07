import 'package:flutter/material.dart';
import 'package:club_engine/data/clubs.dart';
import 'package:club_engine/screens/welcome_screen.dart';
import 'package:club_engine/services/club_service.dart';

class ClubSelectorScreen extends StatefulWidget {
  const ClubSelectorScreen({super.key});

  @override
  State<ClubSelectorScreen> createState() => _ClubSelectorScreenState();
}

class _ClubSelectorScreenState extends State<ClubSelectorScreen> {
  final TextEditingController searchController = TextEditingController();

  List get filteredClubs {
    if (searchController.text.isEmpty) {
      return allClubs;
    }

    return allClubs.where((club) {
      return club.name.toLowerCase().contains(
            searchController.text.toLowerCase(),
          );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F7FB),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),

            const Text(
              "Willkommen 👋",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Wähle deinen Verein",
              style: TextStyle(
                fontSize: 17,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.05),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: TextField(
                  controller: searchController,
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(
                    hintText: "Verein suchen...",
                    prefixIcon: const Icon(Icons.search),
                    border: InputBorder.none,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 18),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: filteredClubs.length,
                itemBuilder: (context, index) {

                  final club = filteredClubs[index];

                  return GestureDetector(

                    onTap: () {

                      ClubService.changeClub(club);

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const WelcomeScreen(),
                        ),
                      );

                    },

                    child: Container(

                      margin: const EdgeInsets.only(bottom:18),

                      decoration: BoxDecoration(

                        color: Colors.white,

                        borderRadius: BorderRadius.circular(28),

                        boxShadow: [

                          BoxShadow(

                            color: Colors.black.withOpacity(.06),

                            blurRadius:22,

                            offset: const Offset(0,12),

                          ),

                        ],

                      ),

                      child: Column(

                        children: [

                          Container(

                            height:6,

                            decoration: BoxDecoration(

                              color: club.primaryColor,

                              borderRadius: const BorderRadius.vertical(

                                top: Radius.circular(28),

                              ),

                            ),

                          ),

                          const SizedBox(height:18),
                                                    Hero(
                            tag: club.id,
                            child: Container(
                              height: 82,
                              width: 82,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                shape: BoxShape.circle,
                              ),
                              padding: const EdgeInsets.all(14),
                              child: Image.asset(
                                club.logoPath,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),

                          const SizedBox(height: 18),

                          Text(
                            club.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              letterSpacing: .2,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            club.slogan,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),

                          const SizedBox(height: 16),

                          if (club.verified)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green.shade50,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.verified,
                                    color: Colors.green,
                                    size: 18,
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    "Verified Club",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          const SizedBox(height: 20),

                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24),
                            child: Row(
                              children: [

                                Expanded(
                                  child: _infoCard(
                                    Icons.location_on,
                                    club.city,
                                  ),
                                ),

                                const SizedBox(width: 10),

                                Expanded(
                                  child: _infoCard(
                                    Icons.groups,
                                    "${club.teamCount} Teams",
                                  ),
                                ),

                                const SizedBox(width: 10),

                                Expanded(
                                  child: _infoCard(
                                    Icons.calendar_month,
                                    "${club.foundationYear}",
                                  ),
                                ),

                              ],
                            ),
                          ),

                          const SizedBox(height: 22),
                                                    Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 24,
                            ),
                            height: 52,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  club.primaryColor,
                                  club.primaryColor.withOpacity(.80),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.center,
                              children: [

                                Icon(
                                  club.sport == "Fußball"
                                      ? Icons.sports_soccer
                                      : Icons.sports_volleyball,
                                  color: Colors.white,
                                ),

                                const SizedBox(width: 10),

                                Text(
                                  club.sport,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(width: 18),

                                const Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Colors.white,
                                ),

                              ],
                            ),
                          ),

                          const SizedBox(height: 20),

                          TextButton(
                            onPressed: () {
                              ClubService.changeClub(club);

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      const WelcomeScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              "Verein betreten",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),

                          const SizedBox(height: 18),

                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                "Powered by Club Platform",
                style: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _infoCard(
    IconData icon,
    String value,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffF5F7FA),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.grey.shade700,
            size: 18,
          ),
          const SizedBox(height: 6),
                    Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}