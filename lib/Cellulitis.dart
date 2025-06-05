import 'package:flutter/material.dart';
import 'package:flutter_application_1/disease_template.dart';

class Cellulitis extends StatelessWidget {
  const Cellulitis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DiseasePageTemplate(
      titleKey: 'cellulitis_name',
      imagePath: 'C:/Users/CS/Desktop/flutter_application_1/lib/Image/2.3.jpg',
      symptomsKey: 'cellulitis_symptoms',
      causesKey: 'cellulitis_causes',
      preventionKey: 'cellulitis_prevention',
    );
  }
}
