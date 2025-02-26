import 'package:component_library/component_library.dart';
import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';
import 'package:sports_list/sports_list.dart';

class GeneralBasketScreen extends StatelessWidget {
  const GeneralBasketScreen(
      {required this.user, required this.teams, super.key});

  final User user;
  final List<Team> teams;

  void showRulesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: Parameter.backgroundColor,
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

  void showPositionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: Parameter.backgroundColor,
          child: const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: PositionsBasketball(),
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
          teams: teams,
        ),
        Expanded(
          child: ListView(
            children: [
              const SizedBox(height: 10),
              const PrimaryTitle(text: 'History of basketball'),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: BasketballHistory(),
              ),
              const SizedBox(height: 20),
              const PrimaryTitle(text: 'Not sure about the rules ?'),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Parameter.headerFooterColor,
                  ),
                  onPressed: () => showRulesDialog(context),
                  child: Text(
                    'Show the rules',
                    style: TextStyle(
                      color: ThemeData.estimateBrightnessForColor(
                                  Parameter.headerFooterColor) ==
                              Brightness.light
                          ? Colors.black
                          : Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              const PrimaryTitle(text: 'Positions'),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Parameter.headerFooterColor,
                  ),
                  onPressed: () => showPositionsDialog(context),
                  child: Text(
                    'Show the positions',
                    style: TextStyle(
                      color: ThemeData.estimateBrightnessForColor(
                                  Parameter.headerFooterColor) ==
                              Brightness.light
                          ? Colors.black
                          : Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const PrimaryTitle(text: 'Terrain'),
              Padding(
                padding: const EdgeInsets.only(right: 32.0, left: 32.0, top: 10.0, bottom: 24.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  child: Image.asset(
                    'packages/component_library/lib/src/assets/images/terrain_de_basket.jpg',
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
