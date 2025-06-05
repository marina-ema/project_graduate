import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class HospitalsScreen extends StatelessWidget {
  final String governorate;

  const HospitalsScreen({Key? key, required this.governorate})
      : super(key: key);

  Future<void> _launchMapUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 11, 170, 143),
        title: Text('Hospitals in $governorate'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('hospitals')
            .where('governorate', isEqualTo: governorate)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No hospitals found.'));
          }

          final docs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final data = docs[index].data() as Map<String, dynamic>;

              final name = data['name'] ?? 'No name';
              final address = data['address'] ?? 'No address';
              final mapUrl = data['map_url'];

              return ListTile(
                title: Text(name),
                subtitle: Text(address),
                trailing: const Icon(Icons.map),
                onTap: () {
                  if (mapUrl != null && mapUrl.toString().isNotEmpty) {
                    _launchMapUrl(mapUrl);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Map link not available.')),
                    );
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
