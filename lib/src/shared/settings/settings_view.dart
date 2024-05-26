import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:vidhyatri/src/shared/theme/controllers/theme_controller.dart';
import 'package:vidhyatri/src/shared/theme/core/flex_theme_dark.dart';

import 'stateful_header_card.dart';
import 'theme_mode_switch.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends StatefulWidget {
  const SettingsView({
    super.key,
    required this.controller,
    required this.themeMode,
    required this.onThemeModeChanged,
  });
  final ThemeController controller;
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;
  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  // final ThemeController controller;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color iconColor = isLight
        ? Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x99),
            theme.colorScheme.onBackground)
        : Color.alphaBlend(theme.colorScheme.primary.withAlpha(0x7F),
            theme.colorScheme.onBackground);
    return StatefulHeaderCard(
      leading: Icon(Icons.gradient_outlined, color: iconColor),
      title: const Text('Theme'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text('Theme setup '),
          ),
          ListTile(
            title: const Text('Theme mode'),
            subtitle: Text('Theme '
                '${widget.themeMode.toString().dotTail}'),
            trailing: ThemeModeSwitch(
              themeMode: widget.themeMode,
              onChanged: widget.onThemeModeChanged,
            ),
            onTap: () {
              if (isLight) {
                widget.onThemeModeChanged(ThemeMode.dark);
              } else {
                widget.onThemeModeChanged(ThemeMode.light);
              }
            },
          ),
        ],
      ),
    );
  }
}
