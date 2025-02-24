import 'package:component_library/component_library.dart';
import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:sports_list/sports_list.dart';

class GeneralBasketScreen extends StatelessWidget {
  const GeneralBasketScreen({required this.user, super.key});

  final User user;

  void showRulesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: Parameter.background_color,
          child: const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: RulesBasketball(),
            ),
          ),
        );
      },
    );
  }

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
        Expanded(
          child: ListView(
            children: [
              const SizedBox(height: 10),
              const PrimaryTitle(text: 'Not sure about the rules ?'),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Parameter.header_footer_color,
                  ),
                  onPressed: () => showRulesDialog(context),
                  child: Text(
                    'Show the rules',
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
              ),
              const SizedBox(height: 20),
              const PrimaryTitle(text: 'History of basketball'),
              const SizedBox(height: 10),
              const BasketballHistory(),
              const SizedBox(height: 20),
              const PrimaryTitle(text: 'Positions'),
              const SizedBox(height: 10),
              const PositionPlayer(),
            ],
          ),
        ),
      ],
    );
  }
}
