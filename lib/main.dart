import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:my_app/firebase_options.dart';
import 'package:my_app/my_new_app/CartScreens/product_catalog_body.dart';
import 'package:my_app/my_new_app/CartScreens/user_cart_screen.dart';
import 'package:my_app/my_new_app/screens/home_screen.dart';
import 'package:my_app/my_new_app/screens/sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  //final bool isLoggedin = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SignInScreen(),
      },
    );
  }
}
