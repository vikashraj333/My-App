import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/my_new_app/CartScreens/product_catalog_body.dart';
import 'package:my_app/my_new_app/CartScreens/product_catalog_view.dart';
import 'package:my_app/my_new_app/CartScreens/user_cart_screen.dart';
import 'package:my_app/my_new_app/screens/sign_in.dart';

import '../CartScreens/cart_controller.dart';
import '../services/authenticationServiceController.dart';
import 'about_us.dart';

class HomeScreen extends StatelessWidget {
  AuthenticationServiceController controller =
      Get.put(AuthenticationServiceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 192, 93, 226),
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text("Novels",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          actions: [
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0, top: 6.0),
                child: Badge(
                  toAnimate: false,
                  badgeContent: GetX<CartController>(
                    builder: ((controller) {
                      return Text(
                        controller.selectedProducts.length.toString(),
                        style: const TextStyle(
                            color: Colors.white, fontSize: 14.0),
                      );
                    }),
                  ),
                  child: const Icon(Icons.shopping_cart),
                ),
              ),
              onTap: () {
                Get.to(UserCartScreen());
              },
            )
          ],
        ),
        backgroundColor: Colors.white,
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('Home'),
                onTap: () {
                  Get.to(ProductsCatalog());
                },
              ),
              ListTile(
                leading: const Icon(Icons.shopping_cart_outlined),
                title: const Text('Go to Cart'),
                onTap: () {
                  Get.to(UserCartScreen());
                },
              ),
              ListTile(
                leading: const Icon(Icons.person_outline),
                title: const Text('About Us'),
                onTap: () {
                  Get.to(const AboutUs());
                },
              ),
              ListTile(
                onTap: () async {
                  controller.authService.signOut();
                  Get.to(SignInScreen());
                },
                leading: const Icon(Icons.exit_to_app),
                title: const Text("Log out"),
              )
            ],
          ),
        ),
        body: ProductCatalogBody());
  }
}
