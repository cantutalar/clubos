import 'package:flutter/material.dart';

class Club {
  final String id;
  final String name;
  final String slogan;
  final String city;
  final int foundationYear;
  final int teamCount;
  final String sport;
  final bool verified;
  final Color primaryColor;
  final Color secondaryColor;
  final String logoPath;

  const Club({
    required this.id,
    required this.name,
    required this.slogan,
    required this.city,
    required this.foundationYear,
    required this.teamCount,
    required this.sport,
    required this.verified,
    required this.primaryColor,
    required this.secondaryColor,
    required this.logoPath,
  });
}