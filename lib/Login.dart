import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ListV.dart';
import 'package:flutter_application_1/Signup.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _LoginState();
}

class _LoginState extends State<login> {
  String? email;
  String? password;
  var formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _submitted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: AppBar(
            title: Text(
              "login_your_account".tr(),
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            backgroundColor: Color.fromARGB(255, 11, 170, 143),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            elevation: 4,
          ),
        ),
      ),
      body: Form(
        key: formKey,
        autovalidateMode: _submitted
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              TextFormField(
                onChanged: (value) {
                  email = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please_enter_email".tr();
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  labelText: "email".tr(),
                  prefixIcon: Icon(Icons.email),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: _submitted && (email == null || email!.isEmpty)
                          ? Colors.red
                          : Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 40),
              TextFormField(
                obscureText: !_isPasswordVisible,
                onChanged: (value) {
                  password = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please_enter_password".tr();
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  labelText: "password".tr(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  prefixIcon: Icon(Icons.lock),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color:
                          _submitted && (password == null || password!.isEmpty)
                              ? Colors.red
                              : Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Container(
                width: double.infinity,
                height: 50,
                child: MaterialButton(
                  onPressed: () async {
                    setState(() {
                      _submitted = true;
                    });
                    if (formKey.currentState!.validate()) {
                      try {
                        final credential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                          email: email!,
                          password: password!,
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const listV(),
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("success_title".tr()),
                        ));
                      } on FirebaseAuthException catch (e) {
                        String errorMsg = "Check E-mail and Password";
                        if (e.code == 'user-not-found') {
                          errorMsg = "No user found for that email.".tr();
                        } else if (e.code == 'wrong-password') {
                          errorMsg =
                              "Wrong password provided for that user.".tr();
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(errorMsg)),
                        );
                      }
                    }
                  },
                  child: Text(
                    "login".tr(),
                    style: TextStyle(color: Colors.black),
                  ),
                  color: Color.fromARGB(255, 11, 170, 143),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("dont_have_account".tr()),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                    child: Text(
                      "sign_up".tr(),
                      style: TextStyle(
                        color: Color.fromARGB(255, 11, 170, 143),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
