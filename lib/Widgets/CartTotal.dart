import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/CartController.dart';

class CartTotal extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          cartController.total.toString(),
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
