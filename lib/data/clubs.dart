import 'package:flutter/material.dart';
import '../models/club.dart';

const herthaClub = Club(
  id: 'hertha_rheidt',
  name: 'FC Hertha Rheidt',
  slogan: 'Mehr als ein Verein',
  primaryColor: Colors.blue,
  secondaryColor: Colors.white,
  logoPath: 'assets/logos/fc_hertha_rheidt.png',
);

const akeClub = Club(
  id: 'ake_volleyball',
  name: 'AKE Volleyball',
  slogan: 'One Team. One Family.',
  primaryColor: Colors.red,
  secondaryColor: Colors.white,
  logoPath: 'assets/logos/ake_volleyball.png',
);

const List<Club> allClubs = [herthaClub, akeClub];
