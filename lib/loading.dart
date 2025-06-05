import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'health.dart';

class LoadingPage extends StatefulWidget {
  final String result;
  LoadingPage({required this.result});

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  double _progress = 0;

  @override
  void initState() {
    super.initState();
    _simulateLoading();
  }

  Future<void> _simulateLoading() async {
    for (int i = 1; i <= 100; i++) {
      await Future.delayed(Duration(milliseconds: 50));
      setState(() {
        _progress = i / 100;
      });
    }
    _showCompletionDialog();
  }

  void _showCompletionDialog() {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: isDarkMode ? Colors.black : Colors.white,
          title: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 11, 170, 143),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check,
                    color: isDarkMode ? Colors.black : Colors.white,
                    size: 30,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  tr('success_title'),
                  style: TextStyle(
                    fontSize: 20,
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  tr('success_message'),
                  style: TextStyle(
                    fontSize: 12,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                )
              ],
            ),
          ),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => health(result: widget.result),
                    ),
                  );
                },
                child: Text(
                  tr('show_result'),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 11, 170, 143),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final backgroundImage = brightness == Brightness.dark
        ? 'C:/Users/CS/Desktop/flutter_application_1/lib/Image/loadingbark.png'
        : 'C:/Users/CS/Desktop/flutter_application_1/lib/Image/Ba.PNG';

    String progressText = (_progress * 100).round().toString();
    if (context.locale.languageCode == 'ar') {
      progressText = progressText.replaceAllMapped(
        RegExp(r'\d'),
        (match) => String.fromCharCode(
            match.group(0)!.codeUnitAt(0) + 0x0660 - 0x0030),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(backgroundImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 150,
            right: 150,
            child: Column(
              children: <Widget>[
                LinearProgressIndicator(
                  value: _progress,
                  backgroundColor: const Color.fromARGB(255, 245, 255, 253),
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    Color.fromARGB(255, 11, 170, 143),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '$progressText${tr('percent_sign')}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 11, 170, 143),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
