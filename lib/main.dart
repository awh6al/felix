import 'package:flutter/material.dart';

import 'package:felix/src/app.dart';
import 'package:felix/src/settings/settings_controller.dart';
import 'package:felix/src/settings/settings_service.dart';

void main() async {
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();

  runApp(FelixApp(settingsController: settingsController));
}
