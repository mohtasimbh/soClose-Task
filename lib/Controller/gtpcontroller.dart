import 'package:get/get.dart';
import 'package:oxy_boot/DataModel/Product.dart';

class CartController extends GetxController {
  static CartController get to => Get.find();

  var _products = {}.obs;

  void addProduct(Product product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }

    Get.snackbar(
      "Product Added",
      "You have added ${product.PName} to the cart",
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }

  void removeProduct(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.remove(product);
    } else {
      _products[product] -= 1;
    }
  }

  void deleteProduct(Product product) {
    _products.remove(product);
  }

  RxMap get products => _products;

  List get productSubtotal => _products.entries
      .map((entry) => entry.key.Price * entry.value)
      .toList();

  String get total => _products.entries
      .map((entry) => entry.key.Price * entry.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
}
