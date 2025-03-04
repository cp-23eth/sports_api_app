import 'package:flutter/material.dart';

class SearchBarCalendar extends StatefulWidget {
  const SearchBarCalendar({required this.word, super.key});

  final Function(String) word;

  @override
  State<SearchBarCalendar> createState() => _SearchBarCalendarState();
}

class _SearchBarCalendarState extends State<SearchBarCalendar> {
  final TextEditingController _controller = TextEditingController();

  void _updateWord(String value) {
    widget.word(value);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: 'Type a team...',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      onChanged: (value) => _updateWord(value),
    );
  }
}
