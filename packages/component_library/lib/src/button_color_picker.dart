import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ButtonColorPicker extends StatelessWidget {
  const ButtonColorPicker(
      {required this.pickerColor,
      required this.availableColors,
      required this.changeColor,
      required this.keyColor,
      super.key});

  final Color pickerColor;
  final List<Color> availableColors;
  final void Function(Color) changeColor;
  final Color keyColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(keyColor),
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Select a color'),
              content: SingleChildScrollView(
                child: BlockPicker(
                  pickerColor: pickerColor,
                  onColorChanged: changeColor,
                  availableColors: availableColors,
                ),
              ),
              actions: <Widget>[
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(keyColor),
                  ),
                  child: Text(
                    'Got it',
                    style: TextStyle(
                      color: ThemeData.estimateBrightnessForColor(keyColor) ==
                              Brightness.light
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
      child: Text(
        'Pick Color',
        style: TextStyle(
          color:
              ThemeData.estimateBrightnessForColor(keyColor) == Brightness.light
                  ? Colors.black
                  : Colors.white,
        ),
      ),
    );
  }
}
