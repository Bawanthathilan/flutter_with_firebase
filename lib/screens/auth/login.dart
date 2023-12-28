import 'package:firebase/constants/colors.dart';
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

  //form key
  final _formkey = GlobalKey<FormState>();

  //email password state
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KbgBlack,
      appBar: AppBar(
        backgroundColor: KbgBlack,
        title: Text(
          "Sign In",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
          child: Column(
            children: [
              Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (val) =>
                            val?.isEmpty == true ? "Enter e valid email" : null,
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                      ),
                      TextFormField(
                        validator: (val) =>
                            val!.length < 6 ? "Enter a valid password" : null,
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                      )
                    ],
                  )),
              SizedBox(
                height: 30,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    "REGISTER",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("LOGIN"),
                ),
              ),
              Center(
                child: ElevatedButton(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
