import 'package:flutter/material.dart';
import 'package:flutter_application_1/disease_template.dart';

class Chickenpox extends StatelessWidget {
  const Chickenpox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DiseasePageTemplate(
      titleKey: 'chickenpox_name',
      imagePath: 'C:/Users/CS/Desktop/flutter_application_1/lib/Image/6.PNG',
      symptomsKey: 'chickenpox_symptoms',
      causesKey: 'chickenpox_causes',
      preventionKey: 'chickenpox_prevention',
    );
  }
}
