import 'dart:typed_data';
import 'dart:io' as io show File;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'loading.dart'; // تأكد من أن هذا الملف موجود

class upload extends StatefulWidget {
  const upload({Key? key}) : super(key: key);

  @override
  State<upload> createState() => _UploadPageState();
}

class _UploadPageState extends State<upload> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  Uint8List? _webImage;
  bool _loading = false;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      if (kIsWeb) {
        final bytes = await pickedFile.readAsBytes();
        setState(() {
          _image = pickedFile;
          _webImage = bytes;
        });
      } else {
        setState(() {
          _image = pickedFile;
        });
      }
    }
  }

  Future<void> _uploadImage() async {
    if (_image == null) return;

    setState(() {
      _loading = true;
    });

    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://192.168.1.3:5000/predict'),
      );

      if (kIsWeb) {
        request.files.add(http.MultipartFile.fromBytes(
          'image',
          _webImage!,
          filename: _image!.name,
        ));
      } else {
        request.files.add(await http.MultipartFile.fromPath(
          'image',
          _image!.path,
        ));
      }

      var response = await request.send();

      if (!mounted) return;

      if (response.statusCode == 200) {
        final res = await http.Response.fromStream(response);
        final result = res.body;

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoadingPage(result: result),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('فشل في الإرسال')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('خطأ أثناء الإرسال: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget? imageWidget;
    if (_image != null) {
      if (kIsWeb && _webImage != null) {
        imageWidget = Image.memory(_webImage!, width: 250, height: 250);
      } else {
        imageWidget =
            Image.file(io.File(_image!.path), width: 250, height: 250);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Photo'),
        backgroundColor: const Color.fromARGB(255, 11, 170, 143),
      ),
      body: Stack(
        children: [
          if (_image != null) Center(child: imageWidget!),
          if (_loading) const Center(child: CircularProgressIndicator()),
          if (_image == null)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => _pickImage(ImageSource.camera),
                    icon: const Icon(Icons.camera_alt, color: Colors.black),
                    label: const Text(
                      'Take Photo',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 11, 170, 143),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () => _pickImage(ImageSource.gallery),
                    icon: const Icon(Icons.photo, color: Colors.black),
                    label: const Text(
                      'Choose from Gallery',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 11, 170, 143),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
      floatingActionButton: _image != null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  heroTag: "camera",
                  backgroundColor: Color.fromARGB(255, 11, 170, 143),
                  child: const Icon(Icons.camera_alt, color: Colors.white),
                  onPressed: () => _pickImage(ImageSource.camera),
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: "gallery",
                  backgroundColor: Color.fromARGB(255, 11, 170, 143),
                  child: const Icon(Icons.photo, color: Colors.white),
                  onPressed: () => _pickImage(ImageSource.gallery),
                ),
                const SizedBox(height: 10),
                FloatingActionButton.extended(
                  backgroundColor: Color.fromARGB(255, 11, 170, 143),
                  label: const Text('Image analysis',
                      style: TextStyle(color: Colors.white)), // لون النص أبيض
                  icon: const Icon(Icons.send, color: Colors.white),
                  onPressed: _uploadImage,
                ),
              ],
            )
          : null,
    );
  }
}
