import 'package:flutter/material.dart';
import 'package:flutter_application_1/Splach2.dart';
// لو انتي مستخدمة localization

class Splash1 extends StatelessWidget {
  const Splash1({super.key});

  @override
  Widget build(BuildContext context) {
    // نجيب اللغة الحالية
    Locale currentLocale = Localizations.localeOf(context);
    bool isArabic = currentLocale.languageCode == 'ar';

    return Scaffold(
      body: Stack(
        children: [
          // Background image based on language
          Positioned.fill(
            child: Image.asset(
              isArabic
                  ? 'lib/Image/arabic.png' // صورة العربي
                  : 'lib/Image/download (1).png', // صورة الانجليزي
              fit: BoxFit.cover,
            ),
          ),

          // Arrow button
          Positioned(
            bottom: 30,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Splash2()),
                );
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(214, 255, 255, 255),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 18, 146, 125)
                          .withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.arrow_forward,
                  color: Color.fromARGB(255, 194, 83, 83),
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
