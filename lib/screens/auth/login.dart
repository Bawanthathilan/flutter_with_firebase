import 'package:firebase/services/auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //ref for the class
  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: ElevatedButton(
        onPressed: () async {
          dynamic result = await _auth.signInAnonymous();
          if (result == Null) {
            print("Error signin");
          } else {
            print("sign in anonymous");
            print(result?.uid);
          }
        },
        child: const Text("Sign in Anonymously"),
      ),
    );
  }
}
