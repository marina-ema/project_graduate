import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeNotifier() {
    _loadTheme(); // تحميل الوضع المحفوظ عند بدء التطبيق
  }

  void toggleTheme() async {
    _isDarkMode = !_isDarkMode; // تغيير الوضع
    notifyListeners(); // إشعار الـ widgets بالحدث
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', _isDarkMode); // حفظ الوضع الجديد
  }

  void _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false; // تحميل الحالة المخزنة
    notifyListeners();
  }
}
