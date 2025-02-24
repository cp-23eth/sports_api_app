import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ButtonColorPicker extends StatelessWidget {
  const ButtonColorPicker(
      {required this.pickerColor,
      required this.changeColor,
      required this.keyColor,
      super.key});

  final Color pickerColor;
  final void Function(Color) changeColor;
  final Color keyColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(keyColor),
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Select a color'),
              content: SingleChildScrollView(
                child: ColorPicker(
                  pickerColor: pickerColor,
                  onColorChanged: changeColor,
                  showLabel: true,
                  pickerAreaHeightPercent: 0.8,
                ),
              ),
              actions: <Widget>[
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(keyColor),
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
