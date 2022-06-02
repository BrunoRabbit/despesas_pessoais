import 'package:despesas_pessoais/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeThemeButton extends StatelessWidget {
  const ChangeThemeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeController>(context);
    return Switch(
      activeColor: Colors.cyan,
      value: themeProvider.isDarkMode,
      onChanged: (value) {
        final provider = Provider.of<ThemeController>(context, listen: false);
        provider.toggleSwitch(value);
      },
    );
  }
}
