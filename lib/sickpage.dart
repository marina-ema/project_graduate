import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/base_page.dart';

class sick extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      lightImage: 'lib/Image/aa.jpg',
      darkImage: 'lib/Image/sick.png',
      message: 'sick_message'.tr(), // استخدم الترجمة هنا
      textColor: Colors.red,
      buttonText: 'find_doctor_button'.tr(), // استخدم الترجمة هنا
      buttonIcon: Icons.location_on,
      buttonAction: () {
        // مفيش أي حاجة بتحصل لما يدوس على الزر
      },
    );
  }
}
