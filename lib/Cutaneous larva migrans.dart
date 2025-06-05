import 'package:flutter/material.dart';
import 'package:flutter_application_1/disease_template.dart';

class Cutaneous extends StatelessWidget {
  const Cutaneous({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DiseasePageTemplate(
      titleKey: 'cutaneouslarva_name',
      imagePath: 'C:/Users/CS/Desktop/flutter_application_1/lib/Image/5.PNG',
      symptomsKey: 'cutaneous_larva_migrans_symptoms',
      causesKey: 'cutaneous_larva_migrans_causes',
      preventionKey: 'cutaneous_larva_migrans_prevention',
    );
  }
}
