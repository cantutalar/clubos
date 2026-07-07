import 'package:flutter/material.dart';

class Club {
  final String id;
  final String name;
  final String slogan;
  final Color primaryColor;
  final Color secondaryColor;
  final String logoPath;

  const Club({
    required this.id,
    required this.name,
    required this.slogan,
    required this.primaryColor,
    required this.secondaryColor,
    required this.logoPath,
  });
}
