// Example of a detailed disease page
import 'package:flutter/material.dart';

class DiseaseDetails1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bacterial Infections - Cellulitis'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
                'C:/Users/CS/Desktop/flutter_application_1/lib/Image/2.3.jpg'), // Adjust path
            SizedBox(height: 16),
            Text(
              'Bacterial Infections - Cellulitis',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Caused when bacteria, most commonly streptococcus and staphylococcus, enter through a crack or break in the skin.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
