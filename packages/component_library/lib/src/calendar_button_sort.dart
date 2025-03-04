import 'package:flutter/material.dart';
import 'package:sports_list/sports_list.dart';

class CalendarButtonSort extends StatefulWidget {
  const CalendarButtonSort(
      {required this.state, required this.search, super.key});

  final Function(String) state;
  final Function(String) search;

  @override
  State<CalendarButtonSort> createState() => _CalendarButtonSortState();
}

class _CalendarButtonSortState extends State<CalendarButtonSort> {
  String _selectedState = '';
  String search = '';

  void _updateState(String newState) {
    setState(() {
      _selectedState = (_selectedState == newState) ? '' : newState;
    });
    widget.state(_selectedState);
  }

  void _updateSearch(String search) {
    setState(() {
      search = search;
    });
    widget.search(search);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildButton('Pre-Season', 'Pre', false),
          _buildButton('Regular Season', 'Regu', false),
          _buildButton('Playoff', 'Post', false),
          IconButton(
            onPressed: () => _updateSearch('Search'),
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

  Widget _buildButton(String text, String stateValue, bool status) {
    return ElevatedButton(
      onPressed: () {
        _updateState(stateValue);
        setState(() {
          status = !status;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor:
            status ?Parameter.backgroundColor : ThemeData.estimateBrightnessForColor(Parameter.backgroundColor) ==
                    Brightness.light
                ? Colors.black
                : Colors.white,
        foregroundColor:
            ThemeData.estimateBrightnessForColor(Parameter.backgroundColor) ==
                    Brightness.light
                ? Colors.white
                : Colors.black,
      ),
      child: Text(text),
    );
  }
}
