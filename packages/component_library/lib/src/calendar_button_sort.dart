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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildButton('Pre-Season', 'Pre'),
          _buildButton('Regular Season', 'Regu'),
          _buildButton('Playoff', 'Post'),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            iconSize: 16,
            color: ThemeData.estimateBrightnessForColor(
                        Parameter.backgroundColor) ==
                    Brightness.light
                ? Colors.black
                : Colors.white,
          )
        ],
      ),
    );
  }

  Widget _buildButton(String text, String stateValue) {
    return ElevatedButton(
      onPressed: () => _updateState(stateValue),
      style: ElevatedButton.styleFrom(
        backgroundColor: _selectedState == stateValue
            ? Parameter.headerFooterColor
            : Colors.transparent,
        foregroundColor:
            ThemeData.estimateBrightnessForColor(Parameter.headerFooterColor) ==
                    Brightness.light
                ? Colors.black
                : Colors.white,
        disabledForegroundColor:
            ThemeData.estimateBrightnessForColor(Parameter.backgroundColor) ==
                    Brightness.light
                ? Colors.black
                : Colors.white,
      ),
      child: Text(text),
    );
  }
}
