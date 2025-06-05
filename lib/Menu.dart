import 'package:flutter/material.dart';
import 'package:flutter_application_1/Login.dart';
import 'package:flutter_application_1/theme/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String? username;
  String? email;
  String? gender;
  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      final doc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (doc.exists) {
        setState(() {
          username = doc['username'];
          email = doc['email'];
          gender = doc['gender'];
        });
      }
    }
  }

  Widget _getGenderIcon() {
    String imagePath;

    if (gender == 'Male') {
      imagePath =
          'C:/Users/CS/Desktop/flutter_application_1/lib/Image/icon1 (1).png';
    } else {
      imagePath =
          'C:/Users/CS/Desktop/flutter_application_1/lib/Image/icon1 (2).png';
    }
    return ClipOval(
      child: Image.asset(
        imagePath,
        width: 60,
        height: 60,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeNotifier>(context).isDarkMode;

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 11, 170, 143),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _getGenderIcon(),
                const SizedBox(height: 10),
                Text(
                  username ?? '...loading',
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
                const SizedBox(height: 5),
                Text(
                  email ?? '',
                  style: const TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: Text('home'.tr()),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: Text('about'.tr()),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: Icon(isDarkMode ? Icons.nights_stay : Icons.sunny),
            title: Text(isDarkMode ? 'dark'.tr() : 'light'.tr()),
            onTap: () {
              Provider.of<ThemeNotifier>(context, listen: false).toggleTheme();
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title:
                Text(context.locale.languageCode == 'en' ? 'English' : 'عربي'),
            onTap: () {
              if (context.locale.languageCode == 'en') {
                context.setLocale(const Locale('ar'));
              } else {
                context.setLocale(const Locale('en'));
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text("Logout".tr()),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => login()),
              );
            },
          ),
        ],
      ),
    );
  }
}
