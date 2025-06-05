import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_application_1/Login.dart';
import 'package:flutter_application_1/Signup.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'C:/Users/CS/Desktop/flutter_application_1/lib/Image/f.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                          'C:/Users/CS/Desktop/flutter_application_1/lib/Image/t.jpg'),
                      radius: 100,
                    ),
                    SizedBox(height: 30),
                    Text(
                      tr('skin_disease'),
                      style: TextStyle(
                        color: Color.fromARGB(255, 194, 83, 83),
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 220,
                          height: 50,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => login(),
                                ),
                              );
                            },
                            child: Text(
                              tr('login'),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            color: Color.fromARGB(255, 18, 146, 125),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            tr('no_account'),
                            style: TextStyle(
                              color: Color.fromRGBO(0, 6, 6, 1),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUp(),
                                ),
                              );
                            },
                            child: Text(
                              tr('create_account'),
                              style: TextStyle(
                                color: Color.fromARGB(255, 11, 170, 143),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
