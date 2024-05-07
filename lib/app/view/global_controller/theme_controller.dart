

import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';

class ThemeController extends SimpleNotifier {

  ThemeMode _mode = ThemeMode.light;
  ThemeMode get mode => _mode;
  bool get isDark => _mode == ThemeMode.dark;

  void toggle() {
    _mode = _mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notify();
  }
  
}


final themeProvider = SimpleProvider(
  (_) => ThemeController(),
  autoDispose: false,
);