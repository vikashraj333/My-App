import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../services/colors.dart';
import 'shopping_controller.dart';
import 'cart_controller.dart';
import 'package:get/get.dart';

class ProductCatalogBody extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final userCartController = Get.put(CartController());
  ProductCatalogBody({Key? key}) : super(key: key);

  var productId = '';
  var productName = '';
  var quantity = '';
  var quantityPrice = '';
  var price = '';
  var imageUrl = '';

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser() {
    return users
        .add({
          'productId': productId,
          'productName': productName,
          'quantity': quantity,
          'quantityPrice': quantityPrice,
          'price': price,
          'imageUrl': imageUrl
        })
        .then(
          (value) => debugPrint('User Added'),
        )
        .catchError(
          (onError) => debugPrint('Failed to add new User: $onError'),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        hexStringToColor("CB2B93"),
        hexStringToColor("9546C4"),
        hexStringToColor("5E61F4")
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: GetX<ShoppingController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10),
              itemCount: controller.products.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white70,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Image.network(
                        controller.products[index].imageUrl,
                        height: 55,
                        width: 55,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(controller.products[index].productName),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Rs.${controller.products[index].price.toString()}',
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 2),
                      TextButton(
                        child: const Icon(
                          Icons.shopping_cart_checkout_outlined,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          userCartController
                              .addProductToCart(controller.products[index]);
                          addUser();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    ));
  }
}
