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
     final repo = Get.put(CartController());
    return Obx(
      () => SizedBox(
        height: 600,
        child: ListView.builder(
            itemCount:controller.products.length,
            itemBuilder: (BuildContext context, int index) {
              return RowCardCart(
                controller: controller,
                product: controller.products.keys.toList()[index],
                quantity: controller.products.values.toList()[index],
                index: index,
              );
            }),
      ),
    );
  }
}


class RowCardCart extends StatelessWidget {
  final CartController controller;
  final Product product;
  final int quantity;
  final int index;
  const RowCardCart({super.key, required this.controller, required this.product, required this.quantity, required this.index});

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
                Expanded(child:Row(
      children: [
        ElevatedButton.icon(
          icon: Icon(Icons.delete),
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
          ),
          onPressed: () { controller.deleteProduct(product);},
          label: Text("Remove"),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
                 // controller.removeProduct(product),
              icon: Icon(Icons.remove),
            ),
            Text(quantity.toString()),
            IconButton(
              onPressed: () {},
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
