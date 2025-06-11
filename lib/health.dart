import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/select_governorate_screen.dart';
import 'package:easy_localization/easy_localization.dart';

class health extends StatelessWidget {
  final String result;
  const health({Key? key, required this.result}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final data = json.decode(result);
    final String mostLikely = data['most_likely'];
    final double confidence = data['confidence'];
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final recommendationTextColor =
        isDarkMode ? Colors.white70 : Colors.black87;
    final hospitalButtonTextColor = isDarkMode ? Colors.white : Colors.black;
    final hospitalButtonIconColor = isDarkMode ? Colors.white : Colors.black;
    return Scaffold(
      appBar: AppBar(
        title: Text('diagnostic_result'.tr()),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'test_result'.tr(),
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              confidence * 100 < 30
                  ? Text(
                      'no_disease_detected'.tr(),
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    )
                  : Column(
                      children: [
                        Text(
                          '${'discovered'.tr()}: $mostLikely ',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'recommendation'.tr(),
                          style: TextStyle(
                            fontSize: 18,
                            color: recommendationTextColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 50),
                        ElevatedButton.icon(
                          icon: Icon(Icons.local_hospital,
                              color: hospitalButtonIconColor),
                          label: Text(
                            "hospitals".tr(),
                            style: TextStyle(color: hospitalButtonTextColor),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 11, 170, 143),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => SelectGovernorateScreen()),
                            );
                          },
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
