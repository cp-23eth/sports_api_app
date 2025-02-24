import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:sports_list/sports_list.dart';
// ignore: depend_on_referenced_packages
import 'package:url_launcher/url_launcher.dart';

class BasketballHistory extends StatelessWidget {
  const BasketballHistory({super.key});

  Future<void> _launchURL() async {
    const url =
        'https://en.wikipedia.org/wiki/Basketball'; // Remplacez par l'URL souhaitée
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SecondaryTitle(
          text: 'Origins and Early Development (1891)',
        ),
        const Paragraphe(
          text:
              'Basketball was invented by Dr. James Naismith, a physical education instructor in Springfield, Massachusetts. In December 1891, Naismith was tasked with creating a new indoor game to keep his students active during the winter. He wrote down 13 basic rules, nailed a peach basket onto the elevated track, and used a soccer ball to create the game.',
        ),
        const Paragraphe(
          text:
              '- First Game: The first game of basketball was played with nine players per team. The objective was to throw the soccer ball into the peach basket to score points, and since there was no hole in the basket, a stick was used to retrieve the ball after every point.',
        ),
        const SecondaryTitle(text: 'More informations'),
        ElevatedButton(
          onPressed: _launchURL,
          style: ElevatedButton.styleFrom(
            backgroundColor: Parameter.header_footer_color,
          ),
          child: Text(
            'Read more',
            style: TextStyle(
              color: ThemeData.estimateBrightnessForColor(
                          Parameter.header_footer_color) ==
                      Brightness.light
                  ? Colors.black
                  : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
