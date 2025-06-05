import 'package:flutter/material.dart';
import 'package:flutter_application_1/disease_template.dart';

class FungalNail extends StatelessWidget {
  const FungalNail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DiseasePageTemplate(
      titleKey: 'fungalnail_name',
      imagePath: 'C:/Users/CS/Desktop/flutter_application_1/lib/Image/4.jpg',
      symptomsKey: 'nail_fungus_symptoms',
      causesKey: 'nail_fungus_causes',
      preventionKey: 'nail_fungus_prevention',
    );
  }
}
