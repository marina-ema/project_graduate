import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';

class Splash4 extends StatelessWidget {
  const Splash4({super.key});

  @override
  Widget build(BuildContext context) {
    // نجيب اللغة الحالية
    Locale currentLocale = Localizations.localeOf(context);
    bool isArabic = currentLocale.languageCode == 'ar';

    return Scaffold(
      body: Stack(
        children: [
          // الخلفية حسب اللغة
          Positioned.fill(
            child: Image.asset(
              isArabic
                  ? 'lib/Image/arabic_final.png' // صورة للغة العربية
                  : 'lib/Image/down.png', // صورة للغة الإنجليزية
              fit: BoxFit.cover,
            ),
          ),

          // زر السهم
          Positioned(
            bottom: 30, // المسافة من أسفل الشاشة
            right: 20, // المسافة من يمين الشاشة
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SplashScreen()), // الانتقال إلى الشاشة الرئيسية
                );
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(
                      214, 255, 255, 255), // لون خلفية الدائرة
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 18, 146, 125)
                          .withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // تغيير الظل
                    ),
                  ],
                ),
                child: Icon(
                  Icons.arrow_forward, // شكل السهم
                  color: Color.fromARGB(255, 194, 83, 83), // لون السهم
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
