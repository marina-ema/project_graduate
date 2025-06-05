import 'package:flutter/material.dart';
import 'package:flutter_application_1/disease_template.dart';

class Shingles extends StatelessWidget {
  const Shingles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DiseasePageTemplate(
      titleKey: 'shingles_name',
      imagePath: 'C:/Users/CS/Desktop/flutter_application_1/lib/Image/7.PNG',
      symptomsKey: 'shingles_symptoms',
      causesKey: 'shingles_causes',
      preventionKey: 'shingles_prevention',
    );
  }
}
