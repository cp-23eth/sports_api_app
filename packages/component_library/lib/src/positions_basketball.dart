import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

class PositionsBasketball extends StatelessWidget {
  const PositionsBasketball({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        PrimaryTitle(text: 'Positions'),
        SecondaryTitle(text: '1. Point Guard - PG'),
        Paragraphe(
          text:
              'Role: The leader of the team on the court, often the fastest player with the best vision of the game.',
        ),
        Paragraphe(
          text:
              'Responsibilities:\n\t- Lead the offense and organize the play\n\t- Distribute passes and create opportunities\n\t- Manage the tempo of the game\n\t- Defend against the opposing point guard',
        ),
        SecondaryTitle(text: '2. Shooting Guard - SG'),
        Paragraphe(
          text:
              'Role: Often the best shooter on the team, capable of scoring from long range.',
        ),
        Paragraphe(
          text:
              'Responsibilities:\n\t- Score points, especially with outside shots\n\t- Cut to the basket and finish plays\n\t- Assist the point guard in managing the game\n\t- Defend against opposing shooting guards',
        ),
        SecondaryTitle(text: '3. Small Forward - SF'),
        Paragraphe(
          text:
              'Role: A versatile player, capable of scoring, defending, and passing.',
        ),
        Paragraphe(
          text:
              'Responsibilities:\n\t- Contribute on offense and defense\n\t- Be effective in one-on-one situations\n\t- Grab rebounds and initiate fast breaks',
        ),
        SecondaryTitle(text: '4. Power Forward - PF'),
        Paragraphe(
          text:
              'Role: A powerful player who plays near the basket but can also shoot mid-range.',
        ),
        Paragraphe(
          text:
              'Responsibilities:\n\t- Protect the rim and grab rebounds\n\t- Play in the low post and score near the basket\n\t- Defend against opposing big men',
        ),
        SecondaryTitle(text: '5. Center - C'),
        Paragraphe(
          text:
              'Role: The tallest and most physical player, anchored in the paint.',
        ),
        Paragraphe(
          text:
              'Responsibilities:\n\t- Defend the basket (blocks and rebounds)\n\t- Dominate in the paint on offense and defense\n\t- Set screens for teammates',
        ),
        SizedBox(height: 10,),
        Center(child: PositionPlayer())
      ],
    );
  }
}
