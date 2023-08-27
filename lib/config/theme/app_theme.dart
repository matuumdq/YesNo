import 'package:flutter/material.dart';

const Color _customColor = Color(0xFFCF9008);

const List<Color> _colorThemes = [
  _customColor,
  Color(0xFFE308EB),
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
            'Colors must be between 0 and ${(_colorThemes.length - 1)}');

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true, colorSchemeSeed: _colorThemes[selectedColor]);
  }
}
