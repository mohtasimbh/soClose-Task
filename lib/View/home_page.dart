import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:oxy_boot/Styles/font_styles.dart';
import 'package:oxy_boot/Widgets/ProductCard.dart';
import 'package:oxy_boot/View/card_screen.dart';
import 'package:oxy_boot/View/favourite_screen.dart';
import 'package:oxy_boot/View/notifications_screen.dart';
import 'package:oxy_boot/View/profile.dart';
import '../DataModel/Product.dart';
import '../Styles/color.dart';
import '../Widgets/brands.dart';
import '../Widgets/item_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int navigationIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      navigationIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    late int index = 0;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: bgWhite,
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
          child: Column(
            children: [
              SizedBox(
                height: 55,
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/logo.png"))),
                ),
              ),
              SizedBox(
                height: 55,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Bounce(
                      onPressed: () => ZoomDrawer.of(context)!.toggle(),
                      duration: const Duration(milliseconds: 500),
                      child: Image.asset(
                        "assets/icons/menu_ic.png",
                        width: 44,
                        height: 44,
                      ),
                    ),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Store location",
                          style: textStyle1,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assets/icons/location_ic.png",
                              width: 14,
                              height: 14.0,
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "Mfangano Street,\nSunbeam shopping complex ",
                              style: textStyle2,
                            ),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    Bounce(
                      onPressed: () {},
                      duration: const Duration(milliseconds: 500),
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/icons/cart_ic.png",
                            width: 44.0,
                            height: 44.0,
                          ),
                          Positioned(
                            right: 0,
                            top: 5,
                            child: Container(
                              width: 10.0,
                              height: 10.0,
                              decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 48.0,
                        child: TextFormField(
                          cursorColor: customBlue,
                          cursorWidth: 2.5,
                          style: textStyle1,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.zero,
                            hintText: "Looking for shoes",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.asset("assets/icons/search_ic.png"),
                            ),
                            hintStyle: textStyle1,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const SizedBox(
                        width: double.infinity,
                        height: 50.0,
                        child: Brands(),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Popular Shoes",
                            style: textStyle4,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "See all",
                              style: textStyle5,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 200.0,
                        child: ListView.builder(
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return ItemView(
                              currentIndex: index,
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "New Arrivals",
                            style: textStyle4,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "See all",
                              style: textStyle5,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                           for (int index = 0; index < Product.products.length; index++)
                            ProductCard(index: index),
                        ],
                      )
                    
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 70.0),
        child: SizedBox(
          width: 56.0,
          height: 56.0,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
            backgroundColor: customBlue,
            elevation: 10,
            child: Image.asset(
              "assets/icons/bag_ic.png",
              width: 20.0,
              height: 20.0,
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 100,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bottomnav_bg.png"),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    navigationIndex = 0;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                  child: Image.asset(
                    "assets/icons/home_ic.png",
                    width: 25,
                    height: 25,
                    color: navigationIndex == 0 ? customBlue : customGrey,
                  ),
                ),
                InkWell(
                  onTap: () {
                    navigationIndex = 1;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FavouriteScreen(),
                      ),
                    );
                  },
                  child: Image.asset(
                    "assets/icons/favourite_ic.png",
                    width: 25,
                    height: 25,
                    color: navigationIndex == 1 ? customBlue : customGrey,
                  ),
                ),
                const SizedBox(
                  width: 60.0,
                ),
                InkWell(
                  onTap: () {
                    navigationIndex = 2;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationsScreen(),
                      ),
                    );
                  },
                  child: Image.asset(
                    "assets/icons/notify_ic.png",
                    width: 25,
                    height: 25,
                    color: navigationIndex == 2 ? customBlue : customGrey,
                  ),
                ),
                InkWell(
                  onTap: () {
                    navigationIndex = 3;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ),
                    );
                  },
                  child: Image.asset(
                    "assets/icons/user_ic.png",
                    width: 25,
                    height: 25,
                    color: navigationIndex == 3 ? customBlue : customGrey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
