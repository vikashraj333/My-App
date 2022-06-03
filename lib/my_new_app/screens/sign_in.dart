import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/my_new_app/screens/home_screen.dart';
import 'package:my_app/my_new_app/services/colors.dart';
import 'package:my_app/my_new_app/screens/reset_password.dart';
import 'package:my_app/my_new_app/screens/reusable_widgets.dart';
import 'package:my_app/my_new_app/screens/sign_up.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController passwdController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailIdController.dispose();
    passwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              hexStringToColor('CB2893'),
              hexStringToColor('9546C4'),
              hexStringToColor('5E61F4')
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 30, 100),
            child: Column(
              children: <Widget>[
                logoWidget('assets/images/logo4.png'),
                const SizedBox(
                  height: 20,
                ),
                createTextField(
                    emailIdController, 'Email ID', Icons.mail_outline, false),
                const SizedBox(
                  height: 20,
                ),
                createTextField(
                    passwdController, 'Password', Icons.lock_outlined, true),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 35,
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const ResetPasswordScreen())),
                    ),
                    child: const Text(
                      'Forget Password?',
                      style: TextStyle(color: Colors.white70),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                firebaseUIButton(context, 'Login', () {
                  setState(() {
                    if (_formkey.currentState!.validate()) {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: emailIdController.text,
                              password: passwdController.text)
                          .then((value) {
                        Get.to(HomeScreen());
                        FirebaseFirestore.instance
                            .collection('UserData')
                            .doc(value.user?.email)
                            .get();
                      }).onError((error, stackTrace) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.redAccent,
                            content: Text('$error')));
                      });
                    }
                  });
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have account?",
                        style: TextStyle(color: Colors.white70)),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                      },
                      child: const Text(
                        " Sign Up",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
