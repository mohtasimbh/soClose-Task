import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../Controller/CartController.dart';
import '../DataModel/Product.dart';

class CartProducts extends StatelessWidget {
  final CartController controller = Get.find();

  CartProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.products.isEmpty
          ? const Center(
              child: Text("Your cart is empty"),
            )
          : SizedBox(
              height: 600,
              child: ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return RowCardCart(
                      controller: controller,
                      product: controller.products.keys.toList()[index],
                      quantity: controller.products.values.toList()[index],
                      index: index,
                    );
                  }),
            ),
      // Container(
      //   padding: const EdgeInsets.symmetric(horizontal: 75),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Text(
      //         'Total',
      //         style: TextStyle(
      //           fontSize: 24,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      //       Text(
      //         '\$${controller.total.value}',
      //         style: TextStyle(
      //           fontSize: 24,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      //     ],
      //   ),
      // )
    );
  }
}

class CartTotal extends StatelessWidget {
  final CartController controller = Get.find();

  CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 75),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '200',
                //'\$${controller.total.value}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              _confirmationDialog();
            },
            style: ElevatedButton.styleFrom(primary: Colors.yellow),
            child: Container(
              width: double.infinity,
              child: Center(
                child: Text(
                  "Proceed",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ]));
  }
}

void _confirmationDialog() {
  final CartController controller = Get.find();
  Get.defaultDialog(
    title: "Really want to proceed ?",
    actions: [
      ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black)),
          onPressed: () {
            Get.back();
          },
          child: Text("Cancel")),
      ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.yellow)),
          onPressed: () {
            controller.transactionCompleted();
          },
          child: Text(
            "Confirm",
            style: TextStyle(color: Colors.black),
          ))
    ],
    backgroundColor: Color(0xff4D4D4D),
    titleStyle: TextStyle(
        color: Colors.white,
        fontFamily: 'Poppins',
        fontSize: 17,
        fontWeight: FontWeight.bold),
    content: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 300,
          height: 200,
          child: ListView.separated(
            separatorBuilder: (_, i) => Divider(),
            itemCount: controller.products.length,
            itemBuilder: (_, index) {
              return ListTile(
                leading: Container(
                  width: 60,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              AssetImage(controller.products[index].PImage))),
                ),
                title: Text(
                  controller.products[index].PName,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
                subtitle: Text(
                  "Ksh. " +
                      (controller.products[index].Price) +
                      " x " +
                      controller.products[index].quantity.toString(),
                  style: TextStyle(
                      fontFamily: "Poppins", color: Colors.white, fontSize: 10),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'name',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 12),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'email',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 12),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "Total Ksh. ",
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 12),
        )
      ],
    ),
  );
}

// row card for the cart

class RowCardCart extends StatelessWidget {
  final CartController controller;
  final Product product;
  final int quantity;
  final int index;
  const RowCardCart(
      {super.key,
      required this.controller,
      required this.product,
      required this.quantity,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 110.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(Product.products[index].PImage),
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  Product.products[index].PName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                const SizedBox(height: 10.0),
                Text(
                  Product.products[index].Price.toString(),
                ),
                const SizedBox(height: 10.0),
                Expanded(
                    child: Row(
                  children: [
                    ElevatedButton.icon(
                      icon: Icon(Icons.delete),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      onPressed: () {
                        controller.deleteProduct(product);
                      },
                      label: Text("Remove"),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            controller.removeProduct(product);
                          },
                          // controller.removeProduct(product),
                          icon: Icon(Icons.remove),
                        ),
                        Text(quantity.toString()),
                        IconButton(
                          onPressed: () {
                            controller.addProduct(product);
                          },
                          //  controller.addProduct(product),
                          icon: Icon(Icons.add),
                        ),
                      ],
                    )
                  ],
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
