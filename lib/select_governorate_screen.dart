import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 11, 170, 143),
        title: Text(
          'Select Governorate',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: selectedGovernorate,
              hint: const Text('Select Governorate'),
              items: governorates.map((gov) {
                return DropdownMenuItem(
                  value: gov,
                  child: Text(gov),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedGovernorate = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.local_hospital, color: Colors.black),
              label: const Text(
                'Hospitals Show',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 11, 170, 143),
              ),
              onPressed: () {
                if (selectedGovernorate != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          HospitalsScreen(governorate: selectedGovernorate!),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Please select a governorate')),
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
