import 'package:flutter/material.dart';

import '../theme/controllers/theme_controller.dart';

class SettingsViewArguments {
  final ThemeController controller;
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;

  SettingsViewArguments({
    required this.controller,
    required this.themeMode,
    required this.onThemeModeChanged,
  });
}
