import '../models/club.dart';
import '../data/clubs.dart';

class ClubService {
  static Club currentClub = herthaClub;

  static List<Club> get clubs => allClubs;

  static void changeClub(Club club) {
    currentClub = club;
  }

  static void changeClubById(String id) {
    currentClub = allClubs.firstWhere((club) => club.id == id);
  }
}
