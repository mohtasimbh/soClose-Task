// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:oxy_boot/View/Accesories.dart';
import 'package:oxy_boot/Widgets/prodouct.dart';

import '../Styles/color.dart';
import '../Styles/font_styles.dart';

class Brands extends StatefulWidget {
  const Brands({Key? key}) : super(key: key);

  @override
  State<Brands> createState() => _BrandsState();
}

class _BrandsState extends State<Brands> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Stack(
          children: [
            Visibility(
              visible: currentIndex == 0,
              child: AnimatedContainer(
                height: 44.0,
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                    color: customBlue,
                    borderRadius: BorderRadius.circular(100.0)),
                duration: const Duration(milliseconds: 1000),
                child: Padding(
                  padding: const EdgeInsets.only(left: 45, right: 10),
                  child: Text(
                    "Shoes",
                    style: textStyle3,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Bounce(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ECommerceScreen(),
                    ),
                  );
                  currentIndex = 0;
                  setState(() {});
                },
                duration: const Duration(milliseconds: 200),
                child: Image.asset(
                  "assets/icons/sport-shoe.png",
                  width: currentIndex == 0 ? 34.0 : 44.0,
                  height: currentIndex == 0 ? 34.0 : 44.0,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 5.0,
        ),
        Stack(
          children: [
            Visibility(
              visible: currentIndex == 1,
              child: Container(
                height: 44.0,
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                    color: customBlue,
                    borderRadius: BorderRadius.circular(100.0)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 45, right: 10),
                  child: Text(
                    "Tshirt",
                    style: textStyle3,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Bounce(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AccesoriesPage(),
                    ),
                  );
                  currentIndex = 1;
                  setState(() {});
                },
                duration: const Duration(milliseconds: 200),
                child: Image.asset(
                  "assets/icons/tshirt.png",
                  width: currentIndex == 1 ? 34.0 : 44.0,
                  height: currentIndex == 1 ? 34.0 : 44.0,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 5.0,
        ),
        Stack(
          children: [
            Visibility(
              visible: currentIndex == 2,
              child: Container(
                height: 44.0,
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                    color: customBlue,
                    borderRadius: BorderRadius.circular(100.0)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 45, right: 10),
                  child: Text(
                    "Pants",
                    style: textStyle3,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Bounce(
                onPressed: () {
                  currentIndex = 2;
                  setState(() {});
                },
                duration: const Duration(milliseconds: 200),
                child: Image.asset(
                  "assets/icons/trouser.png",
                  width: currentIndex == 2 ? 34.0 : 44.0,
                  height: currentIndex == 2 ? 34.0 : 44.0,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 5.0,
        ),
        Stack(
          children: [
            Visibility(
              visible: currentIndex == 3,
              child: Container(
                height: 44.0,
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                    color: customBlue,
                    borderRadius: BorderRadius.circular(100.0)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 45, right: 10),
                  child: Text(
                    "Jacket",
                    style: textStyle3,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Bounce(
                onPressed: () {
                  currentIndex = 3;
                  setState(() {});
                },
                duration: const Duration(milliseconds: 200),
                child: Image.asset(
                  "assets/icons/jacket.png",
                  width: currentIndex == 3 ? 34.0 : 44.0,
                  height: currentIndex == 3 ? 34.0 : 44.0,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 5.0,
        ),
        Stack(
          children: [
            Visibility(
              visible: currentIndex == 4,
              child: Container(
                height: 44.0,
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                    color: customBlue,
                    borderRadius: BorderRadius.circular(100.0)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 45, right: 10),
                  child: Text(
                    "Accessories",
                    style: textStyle3,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Bounce(
                onPressed: () {
                  currentIndex = 4;
                  setState(() {});
                },
                duration: const Duration(milliseconds: 200),
                child: Image.asset(
                  "assets/icons/belt.png",
                  width: currentIndex == 4 ? 34.0 : 44.0,
                  height: currentIndex == 4 ? 34.0 : 44.0,
                ),
              ),
            ),
          ],
        ),
        Stack(
          children: [
            Visibility(
              visible: currentIndex == 5,
              child: Container(
                height: 44.0,
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                    color: customBlue,
                    borderRadius: BorderRadius.circular(100.0)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 45, right: 10),
                  child: Text(
                    "Nike",
                    style: textStyle3,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Bounce(
                onPressed: () {
                  currentIndex = 5;
                  setState(() {});
                },
                duration: const Duration(milliseconds: 200),
                child: Image.asset(
                  "assets/logos/nike_logo.png",
                  width: currentIndex == 5 ? 34.0 : 44.0,
                  height: currentIndex == 5 ? 34.0 : 44.0,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
