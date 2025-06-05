import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? username;
  String? email;
  String? gender; // إضافة متغير gender

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  // دالة جلب البيانات من Firestore
  Future<void> fetchUserData() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      final doc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (doc.exists) {
        setState(() {
          username = doc['username'];
          email = doc['email'];
          gender = doc['gender']; // استرجاع قيمة gender
        });
        print("Gender: $gender"); // طباعة قيمة gender للتحقق
      }
    }
  }

  // دالة عرض الأيقونة بناءً على gender
  Icon _getGenderIcon() {
    if (gender == 'Male') {
      return Icon(Icons.male, size: 50, color: Colors.blue);
    } else if (gender == 'Female') {
      return Icon(Icons.female, size: 50, color: Colors.pink);
    } else {
      return Icon(Icons.person,
          size: 50); // أيقونة افتراضية إذا كانت القيمة فارغة أو غير معروفة
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("الملف الشخصي")),
      body: username == null
          ? Center(
              child:
                  CircularProgressIndicator()) // تحميل البيانات إذا كانت فارغة
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  _getGenderIcon(), // عرض الأيقونة بناءً على الـ gender
                  SizedBox(height: 20),
                  Text("الاسم: $username", style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10),
                  Text("البريد الإلكتروني: $email",
                      style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
    );
  }
}
