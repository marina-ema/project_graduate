import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'hospitals_screen.dart';

class SelectGovernorateScreen extends StatefulWidget {
  const SelectGovernorateScreen({Key? key}) : super(key: key);
  @override
  State<SelectGovernorateScreen> createState() =>
      _SelectGovernorateScreenState();
}

class _SelectGovernorateScreenState extends State<SelectGovernorateScreen> {
  String? selectedGovernorate;
  final List<String> governorates = [
    'Sohag',
    'Assiut',
    'Cairo',
    'Alexandria',
    'Giza',
    'Sharqia',
  ];
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color textColor = isDarkMode ? Colors.white : Colors.black;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 11, 170, 143),
        title: Text(
          'select_governorate'.tr(),
          style: TextStyle(color: textColor),
        ),
        iconTheme: IconThemeData(color: textColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: selectedGovernorate,
              hint: Text(
                'select_governorate'.tr(),
                style: TextStyle(color: textColor),
              ),
              dropdownColor:
                  isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
              items: governorates.map((gov) {
                return DropdownMenuItem(
                  value: gov,
                  child: Text(
                    'gov_$gov'.tr(),
                    style: TextStyle(color: textColor),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedGovernorate = value;
                });
              },
            ),
            const SizedBox(height: 100),
            ElevatedButton.icon(
              icon: Icon(
                Icons.local_hospital,
                color: textColor,
              ),
              label: Text(
                'show_hospitals'.tr(),
                style: TextStyle(color: textColor),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 11, 170, 143),
              ),
              onPressed: () {
                if (selectedGovernorate != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HospitalsScreen(
                        governorate: selectedGovernorate!,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('please_select_governorate'.tr()),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
