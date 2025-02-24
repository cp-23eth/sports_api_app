import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

class RulesBasketball extends StatelessWidget {
  const RulesBasketball({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        PrimaryTitle(text: 'Basketball Rules'),
        SecondaryTitle(text: '1. Duration of a match'),
        Paragraphe(
          text: '- A match consists of four quarters of 12 minutes each.',
        ),
        Paragraphe(
          text:
              '- In case of a tie at the end of regulation time, a 5-minute overtime is played.',
        ),
        SecondaryTitle(
          text: '2. The basket',
        ),
        Paragraphe(
          text:
              '- A basket scored from outside the three-point line is worth 3 points.',
        ),
        Paragraphe(
          text:
              '- A basket scored from inside the three-point line is worth 2 points.',
        ),
        Paragraphe(
          text: '- Free throws are worth 1 point each.',
        ),
        SecondaryTitle(
          text: '3. Possession time',
        ),
        Paragraphe(
          text:
              '- The team in possession of the ball has 24 seconds to attempt a shot. If no shot is attempted within this time, it is called a 24-second violation and the ball is given to the opposing team.',
        ),
        Paragraphe(
          text:
              '- There is a maximum 1-minute timeout for each team, with additional timeouts after each quarter.',
        ),
        SecondaryTitle(
          text: '4. Personal fouls',
        ),
        Paragraphe(
          text:
              '- A personal foul is an infraction committed against a player, such as illegal contact.',
        ),
        Paragraphe(
          text:
              '- 5 personal fouls per player, and they must leave the game if they reach this number.',
        ),
        Paragraphe(
          text:
              '- In case of an offensive foul, the opposing team gets the ball.',
        ),
        Paragraphe(
          text:
              '- In case of a defensive foul, if the fouled player was attempting a shot, they get free throws.',
        ),
        SecondaryTitle(
          text: '5. Technical foul',
        ),
        Paragraphe(
          text:
              '- A technical foul is usually penalized by a free throw for the opposing team and possession of the ball.',
        ),
        Paragraphe(
          text:
              '- It can be given for unsportsmanlike behavior or for not following the rules by a player or coach.',
        ),
        SecondaryTitle(
          text: '6. Dribbling',
        ),
        Paragraphe(
          text:
              '- A player must dribble (bounce the ball on the floor by pushing it with one hand) when moving.',
        ),
        Paragraphe(
          text:
              '- Double dribble: when a player stops their dribble and starts again, or dribbles with both hands simultaneously. This results in a turnover.',
        ),
        SecondaryTitle(
          text: '7. Movement',
        ),
        Paragraphe(
          text:
              '- When moving, the player must keep a pivot foot (the foot that stays on the ground) when they stop.',
        ),
        Paragraphe(
          text: '- An extra step (traveling) without dribbling is a violation.',
        ),
        SecondaryTitle(
          text: '8. The three-point line',
        ),
        Paragraphe(
          text:
              '- If a player shoots from outside the three-point line and scores, it is worth 3 points.',
        ),
        Paragraphe(
          text:
              '- If the shot is taken inside the line, it is only worth 2 points.',
        ),
        SecondaryTitle(
          text: '9. Rebounds',
        ),
        Paragraphe(
          text:
              '- The player who recovers a ball after a missed shot performs a rebound.',
        ),
        Paragraphe(
          text:
              '- The team that gets the rebound has the opportunity to go back with the ball.',
        ),
        SecondaryTitle(
          text: '10. The role of the coach and trainer',
        ),
        Paragraphe(
          text:
              '- The coach can give instructions to their players but cannot physically interfere in the game.',
        ),
        Paragraphe(
          text: '- They can request timeouts to discuss with their players.',
        ),
        SecondaryTitle(
          text: '11. The restricted area (or "paint")',
        ),
        Paragraphe(
          text:
              '- A player cannot stay more than 3 seconds in the opponent\'s restricted area (paint) when not in possession of the ball.',
        ),
        SecondaryTitle(
          text: '12. Team fouls',
        ),
        Paragraphe(
          text:
              '- Starting from the fourth team foul in a quarter, the fouling team concedes free throws for each subsequent foul.',
        ),
        SecondaryTitle(
          text: '13. Charging foul',
        ),
        Paragraphe(
          text:
              '- If a player charges a defender who is already in position, it is considered an offensive foul. The defender must have their feet set before receiving the contact.',
        ),
        SecondaryTitle(
          text: '14. The 8-second violation',
        ),
        Paragraphe(
          text:
              '- A team must advance the ball beyond the midline within 8 seconds of the attack.',
        ),
        SecondaryTitle(
          text: '15. Free throws',
        ),
        Paragraphe(
          text:
              '- When a player is fouled during a shot, they may get free throws. The number of free throws depends on where the shot was attempted (1, 2, or 3 free throws).',
        ),
      ],
    );
  }
}
