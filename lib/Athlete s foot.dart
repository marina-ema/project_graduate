import 'package:flutter/material.dart';
import 'package:flutter_application_1/disease_template.dart';

class Athletesfoot extends StatelessWidget {
  const Athletesfoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DiseasePageTemplate(
      titleKey: 'athletesfoot_name',
      imagePath: 'C:/Users/CS/Desktop/flutter_application_1/lib/Image/35.webp',
      symptomsKey: 'athletes_foot_symptoms',
      causesKey: 'athletes_foot_causes',
      preventionKey: 'athletes_foot_prevention',
    );
  }
}
