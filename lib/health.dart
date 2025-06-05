import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/select_governorate_screen.dart';

class health extends StatelessWidget {
  final String result;

  const health({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = json.decode(result);

    final String mostLikely = data['most_likely'];
    final double confidence = data['confidence'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Diagnostic Result '),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Test result :',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              confidence * 100 < 20
                  ? const Text(
                      'You do not suffer from any of these diseases.',
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
                          'Discovered: $mostLikely\n By ${(confidence * 100).toStringAsFixed(2)}%',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'We recommend that you see a specialist doctor who specializes in evaluation and treatment.',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                icon: const Icon(Icons.local_hospital, color: Colors.black),
                label: const Text(
                  "Hospitals",
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Color.fromARGB(255, 11, 170, 143), // لون الخلفية
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
        ),
      ),
    );
  }
}
