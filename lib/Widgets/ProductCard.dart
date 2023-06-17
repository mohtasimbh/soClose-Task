import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oxy_boot/DataModel/Product.dart';
import 'package:oxy_boot/View/product_view.dart';

import '../Styles/font_styles.dart';

class ProductCard extends StatelessWidget {
  final int index;
  const ProductCard({super.key, required this.index}
  );

  @override
  Widget build(BuildContext context) {
    return     Padding(
                 
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: InkWell(
                                onTap: () {
                                            Navigator.push(context,
                                           CupertinoPageRoute(builder: (context) => const ProductView()));
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.0),
                                      color: Colors.white),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "BEST CHOISE",
                                              style: textStyle6,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              Product.products[index].PName,
                                              style: textStyle4,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                            Product.products[index].Price.toString(),
                                              style: textStyle4,
                                            ),
                                          ],
                                        ),
                                      )),
                                      Expanded(
                                          child: Image.asset(
                                        Product.products[index].PImage,
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.contain,
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                            )
                        ;
  }
}

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: ListView.builder(
      itemCount: Product.products.length,
      itemBuilder: (BuildContext context,int index) {
      return ProductCard(index: index,);
    }
    )
    );
  }
}