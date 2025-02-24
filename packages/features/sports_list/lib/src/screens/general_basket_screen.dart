import 'package:component_library/component_library.dart';
import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';

class GeneralBasketScreen extends StatelessWidget {
  const GeneralBasketScreen({required this.user, super.key});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Header(
          user: user,
        ),
        const SizedBox(height: 20),
        const PrimaryTitle(text: 'Règles du basket-ball'),
        const SecondaryTitle(text: 'Durée d\'un match'),
        const Paragraphe(
          text:
              '- Un match se compose de quatre quarts-temps de 12 minutes chacun.',
        ),
        const Paragraphe(
          text:
              '- En cas d\'égalité à la fin du temps réglementaire, une prolongation de 5 minutes est jouée.',
        ),
      ],
    );
  }
}
