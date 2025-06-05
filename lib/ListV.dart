import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_application_1/Athlete%20s%20foot.dart';
import 'package:flutter_application_1/Cellulitis.dart';
import 'package:flutter_application_1/Chekenpox.dart';
import 'package:flutter_application_1/Cutaneous%20larva%20migrans.dart';
import 'package:flutter_application_1/Fungal%20nail%20infection.dart';
import 'package:flutter_application_1/Impetigo.dart';
import 'package:flutter_application_1/Menu.dart';
import 'package:flutter_application_1/Model.dart';
import 'package:flutter_application_1/Ringworm.dart';
import 'package:flutter_application_1/Shingles.dart';
import 'package:flutter_application_1/uploadpadge.dart';

class listV extends StatefulWidget {
  const listV({super.key});

  @override
  State<listV> createState() => _listVState();
}

class _listVState extends State<listV> {
  List<ProductModel> diseases = [
    ProductModel(
      productName: 'cellulitis_name',
      image: 'C:/Users/CS/Desktop/flutter_application_1/lib/Image/2.3.jpg',
      description: 'cellulitis_description',
    ),
    ProductModel(
      productName: 'impetigo_name',
      image: 'C:/Users/CS/Desktop/flutter_application_1/lib/Image/2.webp',
      description: 'impetigo_description',
    ),
    ProductModel(
      productName: 'athletesfoot_name',
      image: 'C:/Users/CS/Desktop/flutter_application_1/lib/Image/4.jpg',
      description: 'athletesfoot_description',
    ),
    ProductModel(
      productName: 'fungalnail_name',
      image: 'C:/Users/CS/Desktop/flutter_application_1/lib/Image/35.webp',
      description: 'nail_fungus_description',
    ),
    ProductModel(
      productName: 'ringworm_name',
      image: 'C:/Users/CS/Desktop/flutter_application_1/lib/Image/5.webp',
      description: 'ringworm_description',
    ),
    ProductModel(
      productName: 'cutaneouslarva_name',
      image: 'C:/Users/CS/Desktop/flutter_application_1/lib/Image/5.PNG',
      description: 'cutaneouslarva_description',
    ),
    ProductModel(
      productName: 'chickenpox_name',
      image: 'C:/Users/CS/Desktop/flutter_application_1/lib/Image/6.PNG',
      description: 'chickenpox_description',
    ),
    ProductModel(
      productName: 'shingles_name',
      image: 'C:/Users/CS/Desktop/flutter_application_1/lib/Image/7.PNG',
      description: 'shingles_description',
    ),
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'skin_diseases_title'.tr(),
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          ),
        ),
        iconTheme: IconThemeData(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
        ),
        backgroundColor: const Color.fromARGB(255, 11, 170, 143),
      ),
      endDrawer: const Menu(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'search_hint'.tr(),
                hintStyle: TextStyle(color: Theme.of(context).hintColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Theme.of(context).dividerColor),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemCount: diseases
                  .where((disease) => disease.productName
                      .tr()
                      .toLowerCase()
                      .contains(searchQuery))
                  .toList()
                  .length,
              itemBuilder: (context, index) {
                var filteredDiseases = diseases
                    .where((disease) => disease.productName
                        .tr()
                        .toLowerCase()
                        .contains(searchQuery))
                    .toList();

                ProductModel disease = filteredDiseases[index];

                return Card(
                  color: Theme.of(context).cardColor,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(15)),
                        child: Image.asset(
                          disease.image,
                          fit: BoxFit.cover,
                          height: 140,
                          width: double.infinity,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            disease.productName.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          disease.description.tr(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () {
                            Widget page;
                            switch (index) {
                              case 0:
                                page = Cellulitis();
                                break;
                              case 1:
                                page = Impetigo();
                                break;
                              case 2:
                                page = Athletesfoot();
                                break;
                              case 3:
                                page = FungalNail();
                                break;
                              case 4:
                                page = Ringworm();
                                break;
                              case 5:
                                page = Cutaneous();
                                break;
                              case 6:
                                page = Chickenpox();
                                break;
                              case 7:
                                page = Shingles();
                                break;
                              default:
                                page = Scaffold(
                                  appBar: AppBar(title: Text("Details")),
                                  body: Center(
                                      child: Text("No details available.")),
                                );
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => page),
                            );
                          },
                          child: Text(
                            'read_more'.tr(),
                            style: TextStyle(
                              fontSize: 12.5,
                              color: Color.fromARGB(255, 225, 102, 102),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 11, 170, 143),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => upload()),
          );
        },
        child: const Icon(Icons.cloud_upload, color: Colors.white),
      ),
    );
  }
}
