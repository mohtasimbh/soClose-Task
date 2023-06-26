import 'package:get/get.dart';
import '../DataModel/Product.dart';
import '../Controller/FirebaseService.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();
  // Add a list of Product objects.
  final products = <Product>[].obs;

  @override
  void onInit() {
    products.bindStream(FirestoreDB().getAllProducts());
    super.onInit();
  }
}
