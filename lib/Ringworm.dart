import 'package:flutter/material.dart';
import 'package:flutter_application_1/disease_template.dart';

class Ringworm extends StatelessWidget {
  const Ringworm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DiseasePageTemplate(
      titleKey: 'ringworm_name',
      imagePath: 'C:/Users/CS/Desktop/flutter_application_1/lib/Image/5.webp',
      symptomsKey: 'ringworm_symptoms',
      causesKey: 'ringworm_causes',
      preventionKey: 'ringworm_prevention',
    );
  }
}
