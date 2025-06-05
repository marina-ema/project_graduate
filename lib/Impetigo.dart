import 'package:flutter/material.dart';
import 'package:flutter_application_1/disease_template.dart';

class Impetigo extends StatelessWidget {
  const Impetigo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DiseasePageTemplate(
      titleKey: 'impetigo_name',
      imagePath: 'C:/Users/CS/Desktop/flutter_application_1/lib/Image/2.webp',
      symptomsKey: 'impetigo_symptoms',
      causesKey: 'impetigo_causes',
      preventionKey: 'impetigo_prevention',
    );
  }
}
