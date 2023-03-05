// ignore_for_file: depend_on_referenced_packages, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:oxy_boot/View/product_view.dart';

import '../Styles/color.dart';
import '../Styles/font_styles.dart';

class ItemView extends StatefulWidget {
  int currentIndex;
  ItemView({
    super.key,
    required this.currentIndex,
  });

  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Bounce(
        onPressed: () {
          Navigator.push(context,
              CupertinoPageRoute(builder: (context) => const ProductView()));
        },
        duration: const Duration(milliseconds: 500),
        child: Container(
          width: 160.0,
          height: 200.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: widget.currentIndex % 2 == 0
                          ? Image.asset("assets/shows/img3.png")
                          : Image.asset("assets/shows/img2.png"))),
              Expanded(
                  flex: 2,
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "BEST SELLER",
                                style: textStyle6,
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(
                                height: 2.0,
                              ),
                              Text(
                                "Nike Jordan",
                                style: textStyle4,
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "\$ 493.00",
                                style: textStyle4,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Bounce(
                            onPressed: () {},
                            duration: const Duration(milliseconds: 500),
                            child: Container(
                              width: 44.0,
                              height: 44.0,
                              decoration: BoxDecoration(
                                color: customBlue,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    bottomRight: Radius.circular(16.0)),
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
