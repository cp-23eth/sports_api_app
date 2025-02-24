import 'package:component_library/component_library.dart';
import 'package:domain_entities/domain_entities.dart';
import 'package:flutter/material.dart';

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
          backgroundColor: const Color(0xFF0B132B),
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
                    backgroundColor: const Color(0xFF1C5D99),
                  ),
                  onPressed: () => showRulesDialog(context),
                  child: const Text(
                    'Show the rules',
                    style: TextStyle(
                      color: Colors.white,
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
