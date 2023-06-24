import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxy_boot/Controller/gtpcontroller.dart';
import 'package:oxy_boot/DataModel/Product.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: GetX<CartController>(
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              Product product = controller.products.keys.elementAt(index);
              int quantity = controller.products.values.elementAt(index);

              return ListTile(
                leading: Image.asset(
                  product.PImage,
                  width: 50,
                  height: 50,
                ),
                title: Text(product.PName),
                subtitle: Text('Quantity: $quantity'),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    controller.deleteProduct(product);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
