import 'dart:typed_data';
import 'dart:io' as io show File;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:easy_localization/easy_localization.dart';
import 'loading.dart';

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
        Uri.parse('http://192.168.1.5:5000/predict'),
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
          SnackBar(content: Text('upload_fail'.tr())),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${'upload_error'.tr()} $e')),
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
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
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
        title: Text('upload_photo'.tr()),
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
                    icon: Icon(Icons.camera_alt,
                        color: isDarkMode ? Colors.white : Colors.black),
                    label: Text(
                      'take_photo'.tr(),
                      style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 11, 170, 143),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () => _pickImage(ImageSource.gallery),
                    icon: Icon(Icons.photo,
                        color: isDarkMode ? Colors.white : Colors.black),
                    label: Text(
                      'choose_gallery'.tr(),
                      style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 11, 170, 143),
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
                  backgroundColor: const Color.fromARGB(255, 11, 170, 143),
                  child: Icon(Icons.camera_alt,
                      color: isDarkMode ? Colors.white : Colors.black),
                  onPressed: () => _pickImage(ImageSource.camera),
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: "gallery",
                  backgroundColor: const Color.fromARGB(255, 11, 170, 143),
                  child: Icon(Icons.photo,
                      color: isDarkMode ? Colors.white : Colors.black),
                  onPressed: () => _pickImage(ImageSource.gallery),
                ),
                const SizedBox(height: 10),
                FloatingActionButton.extended(
                  backgroundColor: const Color.fromARGB(255, 11, 170, 143),
                  label: Text(
                    'image_analysis'.tr(),
                    style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black),
                  ),
                  icon: Icon(Icons.send,
                      color: isDarkMode ? Colors.white : Colors.black),
                  onPressed: _uploadImage,
                ),
              ],
            )
          : null,
    );
  }
}
