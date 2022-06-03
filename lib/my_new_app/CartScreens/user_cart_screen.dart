import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/my_new_app/screens/reusable_widgets.dart';
import 'package:my_app/my_new_app/services/payment.dart';
import '../services/colors.dart';
import 'cart_controller.dart';

class UserCartScreen extends StatelessWidget {
  UserCartScreen({Key? key}) : super(key: key);
  final Stream<QuerySnapshot> userData =
      FirebaseFirestore.instance.collection('users').snapshots();

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> removeUser(id) {
    return users.doc(id).delete().catchError(
          (onError) =>
              Get.snackbar('Error', 'Error while removing the user\n $onError'),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 192, 93, 226),
          elevation: 2,
          title: const Text(
            'Cart',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringToColor("CB2B93"),
            hexStringToColor("9546C4"),
            hexStringToColor("5E61F4")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: GetBuilder<CartController>(
            builder: ((controller) {
              return Column(children: [
                SizedBox(
                  height: 500,
                  child: ListView.builder(
                      itemCount: controller.selectedProducts.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          tileColor: Colors.white70,
                          minVerticalPadding: 5,
                          leading: Image.network(
                              controller.selectedProducts[index].imageUrl),
                          title: Text(
                              controller.selectedProducts[index].productName),
                          subtitle: Text(controller
                              .selectedProducts[index].price
                              .toString()),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    controller.decreaseQuantityProduct(index);
                                  },
                                  child: const Icon(
                                    Icons.arrow_back_ios_new_outlined,
                                    color: Colors.white,
                                  )),
                              Text(controller.selectedProducts[index].quantity
                                  .toString()),
                              TextButton(
                                  onPressed: () {
                                    controller.increaseQuantityProduct(index);
                                  },
                                  child: const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Colors.white,
                                  )),
                              ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) {
                                        if (states
                                            .contains(MaterialState.pressed)) {
                                          return Colors.black26;
                                        }
                                        return Colors.white;
                                      }),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)))),
                                  onPressed: () {
                                    controller.removeProductsFromCart(
                                        controller.selectedProducts[index]);
                                  },
                                  child: const Icon(
                                    Icons.delete_outline,
                                    color: Colors.red,
                                  )),
                            ],
                          ),
                        );
                      }),
                ),
                const SizedBox(height: 10),
                Text(
                  'Total Price : Rs.${controller.totalCost}',
                  style: const TextStyle(fontSize: 30.0),
                ),
                const SizedBox(
                  height: 10,
                ),
                firebaseUIButton(context, 'Proceed to Payement', () {
                  Get.to(PaymentScreen());
                }),
              ]);
            }),
          ),
        ));
  }
}
