import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:my_app/my_new_app/CartScreens/product_catalog_body.dart';
import 'package:my_app/my_new_app/CartScreens/user_cart_screen.dart';

import '../services/colors.dart';
import 'shopping_controller.dart';
import 'cart_controller.dart';
import 'package:get/get.dart';

class ProductsCatalog extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final userCartController = Get.put(CartController());
  ProductsCatalog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 192, 93, 226),
          elevation: 2,
          title: const Text(
            'Novels',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
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
        body: ProductCatalogBody());
  }
}
