import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';

class DetailMatch extends StatelessWidget {
  const DetailMatch(
      {required this.game,
      required this.teams,
      required this.stadiums,
      super.key});

  final Game game;
  final List<Team> teams;
  final List<Stadium> stadiums;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
