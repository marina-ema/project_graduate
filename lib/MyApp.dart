import 'package:flutter/material.dart';
import 'package:flutter_application_1/Login.dart';
import 'package:flutter_application_1/Model.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SkinDiseasesPage(),
    );
  }
}

class SkinDiseasesPage extends StatelessWidget {
  // قائمة تحتوي على البيانات
  final List<ProductModel> diseases = [
    ProductModel(
      productName: 'Bacterial Infections - Cellulitis',
      image: 'assets/images/2.3.jpg', // ضع الصورة في مجلد "assets/images"
      description:
          'Caused when bacteria, most commonly streptococcus and staphylococcus, enter through a crack or break in the skin.',
    ),
    ProductModel(
      productName: 'Bacterial Infections - Cellulitis',
      image: 'assets/images/2.3.jpg', // ضع الصورة في مجلد "assets/images"
      description:
          'Caused when bacteria, most commonly streptococcus and staphylococcus, enter through a crack or break in the skin.',
    ),
    ProductModel(
      productName: 'Bacterial Infections - Cellulitis',
      image: 'assets/images/2.3.jpg', // ضع الصورة في مجلد "assets/images"
      description:
          'Caused when bacteria, most commonly streptococcus and staphylococcus, enter through a crack or break in the skin.',
    ),
    ProductModel(
      productName: 'Bacterial Infections - Cellulitis',
      image: 'assets/images/2.3.jpg', // ضع الصورة في مجلد "assets/images"
      description:
          'Caused when bacteria, most commonly streptococcus and staphylococcus, enter through a crack or break in the skin.',
    ),
    ProductModel(
      productName: 'Bacterial Infections - Cellulitis',
      image: 'assets/images/2.3.jpg', // ضع الصورة في مجلد "assets/images"
      description:
          'Caused when bacteria, most commonly streptococcus and staphylococcus, enter through a crack or break in the skin.',
    ),
    ProductModel(
      productName: 'Bacterial Infections - Cellulitis',
      image: 'assets/images/2.3.jpg', // ضع الصورة في مجلد "assets/images"
      description:
          'Caused when bacteria, most commonly streptococcus and staphylococcus, enter through a crack or break in the skin.',
    ),
    ProductModel(
      productName: 'Bacterial Infections - Cellulitis',
      image: 'assets/images/2.3.jpg', // ضع الصورة في مجلد "assets/images"
      description:
          'Caused when bacteria, most commonly streptococcus and staphylococcus, enter through a crack or break in the skin.',
    ),
    ProductModel(
      productName: 'Bacterial Infections - Cellulitis',
      image: 'assets/images/2.3.jpg', // ضع الصورة في مجلد "assets/images"
      description:
          'Caused when bacteria, most commonly streptococcus and staphylococcus, enter through a crack or break in the skin.',
    ),
    // إضافة المزيد من البيانات كما تحتاج
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skin Diseases'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // عدد الأعمدة
          crossAxisSpacing: 10, // المسافة بين الأعمدة
          mainAxisSpacing: 10, // المسافة بين الصفوف
        ),
        itemCount: diseases.length, // عدد العناصر
        itemBuilder: (context, index) {
          final disease = diseases[index];
          return Card(
            elevation: 5, // ارتفاع الظل
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  disease.image, // صورة العنصر
                  height: 80,
                  fit: BoxFit.contain, // يمكنك تعديل BoxFit حسب الحاجة
                ),
                SizedBox(height: 10),
                Text(
                  disease.productName, // عنوان العنصر
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    disease.description, // وصف العنصر
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                SizedBox(height: 10), // الفاصل بين الوصف وزر "login"
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => login()),
                    );
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Color.fromARGB(255, 11, 170, 143),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
