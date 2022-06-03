import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/my_new_app/services/colors.dart';
import 'package:my_app/my_new_app/screens/reusable_widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController unameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: _formkey,
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              hexStringToColor("CB2B93"),
              hexStringToColor("9546C4"),
              hexStringToColor("5E61F4")
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
              child: Column(
                children: <Widget>[
                  logoWidget('assets/images/logo4.png'),
                  const SizedBox(
                    height: 20,
                  ),
                  createTextField(unameTextController, 'User Name',
                      Icons.person_outline, false),
                  const SizedBox(
                    height: 20,
                  ),
                  createTextField(emailTextController, 'Email ID',
                      Icons.email_outlined, false),
                  const SizedBox(
                    height: 20,
                  ),
                  createTextField(passwordTextController, 'Password',
                      Icons.lock_outline, true),
                  const SizedBox(
                    height: 20,
                  ),
                  firebaseUIButton(context, "Sign Up", () {
                    setState(() {
                      if (_formkey.currentState!.validate()) {
                        final credential = FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: emailTextController.text,
                                password: passwordTextController.text)
                            .then((value) {
                          debugPrint("Created New Account");
                          FirebaseFirestore.instance
                              .collection('UserData')
                              .doc(value.user?.email)
                              .set({
                            'email': value.user?.email,
                          });
                          Navigator.pop(context);
                        }).catchError((error) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.redAccent,
                              content: Text('$error')));
                        });
                      }
                    });
                  })
                ],
              ),
            ))),
      ),
    );
  }
}
