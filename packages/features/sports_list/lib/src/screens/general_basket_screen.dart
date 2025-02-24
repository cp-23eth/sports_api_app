import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

class GeneralBasketScreen extends StatelessWidget {
  const GeneralBasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Header(),
        SizedBox(height: 20),
        PrimaryTitle(text: 'Règles du basket-ball'),
        SecondaryTitle(text: 'Durée d\'un match'),
        Paragraphe(
          text:
              '- Un match se compose de quatre quarts-temps de 12 minutes chacun.',
        ),
        Paragraphe(
          text:
              '- En cas d\'égalité à la fin du temps réglementaire, une prolongation de 5 minutes est jouée.',
        ),
      ],
    );
  }
}
