import 'package:flutter/material.dart';
import 'package:sports_list/sports_list.dart';

class CalendarButtonSort extends StatefulWidget {
  const CalendarButtonSort({required this.state, super.key});

  final Function(String) state;

  @override
  State<CalendarButtonSort> createState() => _CalendarButtonSortState();
}

class _CalendarButtonSortState extends State<CalendarButtonSort> {
  String _selectedState = '';

  void _updateState(String newState) {
    setState(() {
      _selectedState = (_selectedState == newState) ? '' : newState;
    });
    widget.state(_selectedState);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Parameter.headerFooterColor.withAlpha(200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildButton('Pre-Saison', 'Pre'),
          _buildButton('Regular Saison', 'Regu'),
          _buildButton('Post-Saison', 'Post'),
        ],
      ),
    );
  }

  Widget _buildButton(String text, String stateValue) {
    return ElevatedButton(
      onPressed: () => _updateState(stateValue),
      style: ElevatedButton.styleFrom(
        backgroundColor: _selectedState == stateValue
            ? Parameter.todaysMatchsColor
            : Colors.transparent,
        foregroundColor: ThemeData.estimateBrightnessForColor(
                                Parameter.backgroundColor) ==
                            Brightness.light
                        ? Colors.black
                        : Colors.white,
      ),
      child: Text(text),
    );
  }
}
