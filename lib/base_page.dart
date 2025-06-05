import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart'; // تأكد من استيراد easy_localization

class BasePage extends StatelessWidget {
  final String lightImage;
  final String darkImage;
  final String message;
  final Color textColor;
  final String buttonText;
  final VoidCallback buttonAction;
  final IconData buttonIcon;

  const BasePage({
    required this.lightImage,
    required this.darkImage,
    required this.message,
    required this.textColor,
    required this.buttonAction,
    this.buttonText = 'Back',
    required this.buttonIcon,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final imagePath = isDarkMode ? darkImage : lightImage;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      message.tr(), // استخدم الترجمة هنا
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32.0),
                    child: ElevatedButton.icon(
                      onPressed: buttonAction,
                      icon: Icon(
                        buttonIcon,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                      label: Text(
                        buttonText.tr(), // استخدم الترجمة هنا أيضًا
                        style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
